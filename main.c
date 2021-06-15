#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>
#include <rand.h>
#include "Sprites.c"
#include "platform.c"
#include <gb/font.h>
#include "windowmap.c"
#include "game_over_map.c"
#include "welcomemap.c"
#include "platform_direction.c"
#include "sound.c"
#include "gbt_player.h"
#include "Splash.c"
#include "GameOverSplash.c"
#include "SplashTiles.c"
#include "IonicLimbMap.c"
#include "IonicLimbTiles.c"

extern const unsigned char * song_Data[];

#define PLATFORM_COUNT 4

struct MetaSprite platforms[PLATFORM_COUNT];
struct MetaSprite player;

INT8 currentSpeedY;
BYTE jumping = 0;
UBYTE spriteSize = 8;
INT8 floor = 114;
const INT8 gravity = -2;
const INT8 BASE_JUMP_SPEED = 15;
UINT8 activePlatform = 1;
UINT8 platformSpeed = 4;
UINT8 platformWaitLength = 4;
enum PlatformDirection platformDirection = LEFT;
UINT8 waitCount = 0;
UBYTE gameActive = 1;
UINT16 score = 0;

void performantDelay(UINT8 numloops)
{
    UINT8 i;
    for(i=0; i<numloops;i++){
        wait_vbl_done();
    }
}

void playSound(enum Sound sound){
    switch(sound){
        case JUMP:
            NR10_REG = 0x16; 
            NR11_REG = 0x40;
            NR12_REG = 0x73;  
            NR13_REG = 0x00;   
            NR14_REG = 0xC3;	        
            break;
        case GAME_OVER:
            NR10_REG = 0x79;
            NR11_REG = 0xC2;
            NR12_REG = 0x54;
            NR13_REG = 0x73;
            NR14_REG = 0x86;
            break;
        case LOGO:
            NR10_REG = 0x7f;
            NR11_REG = 0xbf;
            NR12_REG = 0x87;
            NR13_REG = 0x37;
            NR14_REG = 0x87;
            break;
    }
}

void movePlatform(struct MetaSprite* platform, UINT8 x, UINT8 y)
{
    move_sprite(platform->spriteIds[0], x, y);
    move_sprite(platform->spriteIds[1], x + spriteSize, y);
    move_sprite(platform->spriteIds[2], x + (spriteSize * 2), y);
}

void movePlayer(struct MetaSprite* player, UINT8 x, UINT8 y)
{
    move_sprite(player->spriteIds[0], x, y);
    move_sprite(player->spriteIds[1], x + spriteSize, y);
    move_sprite(player->spriteIds[2], x, y + spriteSize);
    move_sprite(player->spriteIds[3], x + spriteSize, y + spriteSize);
}

void initPlatform(UINT8 id, UINT8 x, UINT8 y)
{ 
    platforms[id].x = x; //76
    platforms[id].y = y; //130
    platforms[id].width = 24;
    platforms[id].height = 8;
    platforms[id].yAtJump = y;
    set_sprite_tile(5 + (id * 3),0);
    platforms[id].spriteIds[0] = 5 + (id * 3);
    set_sprite_tile(6 + (id * 3),1);
    platforms[id].spriteIds[1] = 6 + (id * 3);
    set_sprite_tile(7 + (id * 3),2);
    platforms[id].spriteIds[2] = 7 + (id * 3);

    movePlatform(&platforms[id], platforms[id].x, platforms[id].y);
}

void initPlayer(UINT8 x)
{
    player.x = x;
    player.y = 84;
    player.width = 16;
    player.height = 16;
    set_sprite_tile(1,3);
    player.spriteIds[0] = 1;
    set_sprite_tile(2,4);
    player.spriteIds[1] = 2;
    set_sprite_tile(3,5);
    player.spriteIds[2] = 3;
    set_sprite_tile(4,6);
    player.spriteIds[3] = 4;

    movePlayer(&player, player.x, player.y);
}

INT8 wouldHitSurface(struct MetaSprite* platform)
{
    if(platform->y <= platform->yAtJump){
        return platform->yAtJump;
    }
    return -1;
}

BOOLEAN isCollision(){
    if(platforms[activePlatform].y < 100){
        switch(platformDirection){
            case LEFT:
                return platforms[activePlatform].x < 96;
            case RIGHT:
                return platforms[activePlatform].x > 56 && platforms[activePlatform].x < 240;
            default: 
                return 0;
        }
    }
    return 0;
}

BOOLEAN platformIsUnderPlayer(){
    if(platforms[activePlatform].y <= 102){
        switch(platformDirection){
            case LEFT:
                return platforms[activePlatform].x < 90;
            case RIGHT:
                return platforms[activePlatform].x > 62 && platforms[activePlatform].x < 240;
            default: 
                return 0;
        }
    }
    return 0;
}

void jump()
{
    INT8 possibleSurfaceY;
    
    if(jumping == 0) {
        playSound(JUMP);    
        jumping = 1;
        for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
        {
            platforms[i].yAtJump = platforms[i].y;
        }
        currentSpeedY = BASE_JUMP_SPEED;
    }
    currentSpeedY = currentSpeedY + gravity;
    if(currentSpeedY < -(BASE_JUMP_SPEED - gravity)) currentSpeedY = 0;

    for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
    {
        if(platformIsUnderPlayer()){
            platforms[i].yAtJump = 100;
        }
        platforms[i].y += currentSpeedY;    
        possibleSurfaceY = wouldHitSurface(&platforms[i]);
        if(currentSpeedY == 0 || possibleSurfaceY > -1){
            
            jumping = 0;
            platforms[i].y = platforms[i].yAtJump;
        }
        movePlatform(&platforms[i], platforms[i].x, platforms[i].y);
    }
}

void updatePlayer()
{
    movePlayer(&player, player.x, player.y);
}

UINT8 getRand(UINT8 min, UINT8 max){
    return (((UINT8)rand()) % ((UINT8)max + (UINT8) 1 - min)) + min;
}

void setScore(BOOLEAN increment){
    if(increment) score++;
    for (UINT8 i = 0; i < 4; i++)
    {
        windowmap[6+i] = (unsigned char) (0x23);
    }
    
    if(score < 10){  
        windowmap[9] = (unsigned char) (0x23 + score);
    }
    else if(score < 100){
        UINT8 tens = score / 10;
        UINT8 ones = score % 10;
        windowmap[8] = (unsigned char) (0x23 + tens);
        windowmap[9] = (unsigned char) (0x23 + ones);
    }
    else if(score < 1000){
        UINT8 huns = score / 100;
        UINT8 tens = (score % 100) / 10;
        UINT8 ones = score % 10;
        windowmap[7] = (unsigned char) (0x23 + huns);
        windowmap[8] = (unsigned char) (0x23 + tens);
        windowmap[9] = (unsigned char) (0x23 + ones);
    }
    else if(score < 10000){
        UINT8 thous = score / 1000;
        UINT8 huns = (score % 1000) / 100;
        UINT8 tens = (score % 100) / 10;
        UINT8 ones = score % 10;
        windowmap[6] = (unsigned char) (0x23 + thous);
        windowmap[7] = (unsigned char) (0x23 + huns);
        windowmap[8] = (unsigned char) (0x23 + tens);
        windowmap[9] = (unsigned char) (0x23 + ones);
    }
}

void updateScore(){
    set_win_tiles(0,0,11,1, windowmap);
    move_win(7,136);
}

void changeActivePlatform(){
    activePlatform = activePlatform + 1 > 3 ? 0 : activePlatform + 1;
}

void randomiseValues(BOOLEAN incrementScore){
    if(platforms[activePlatform].y == 100){
        waitCount = 0;
        platformWaitLength = getRand(2,15); 
        platformSpeed = getRand(8,10);
        platformDirection = getRand(0,1);
        initPlatform(activePlatform, 76, 100);

        changeActivePlatform();

        UINT8 x = platformDirection ? 0xF0 : 170; 
        initPlatform(activePlatform, x, 60);
        setScore(incrementScore);
    }
}

void loadFonts(){
    font_t min_font;
    
    font_init();
    min_font = font_load(font_min);
    font_set(min_font);
}

void showLogo(){
    set_bkg_data(0,120, IonicLimbTiles);
    set_bkg_tiles(0,0,20,18, IonicLimbMap);
    move_win(7,0);
    SHOW_BKG;
    playSound(LOGO);
    performantDelay(200);
}

void showStartScreen(){
    set_win_tiles(0,0,20,18, Splash);
    move_win(7,0);
    SHOW_WIN;
    waitpad(J_START);
}

void showGameOverScreen(){
    for (UINT8 i = 0; i < 4; i++)
    {
        GameOverSplash[346+i] = windowmap[6+i];
    }
    
    initPlatform(0, 170, 100);
    initPlatform(1, 170, 60);
    initPlatform(2, 170, 60);
    initPlatform(3, 170, 60);
    initPlayer(170);
    set_win_tiles(0,0,20,18, GameOverSplash);
    move_win(7,0);
    SHOW_WIN;
    waitpad(J_START);
}

void seedRandom(){
    uint16_t seed = LY_REG;
    seed |= (uint16_t)DIV_REG << 8;
    initrand(seed);
}

UINT8 fontNumBase = 0x01;

BOOLEAN activePlatformIsWaiting(){
    if(waitCount < platformWaitLength){
        waitCount++;
        return 1;
    }
    return 0;
}

void moveActivePlatform(){
    if(activePlatformIsWaiting()) return;

    switch(platformDirection){
        case LEFT:
            if(platforms[activePlatform].x - platformSpeed > 76){
                platforms[activePlatform].x -= platformSpeed;
                movePlatform(&platforms[activePlatform], platforms[activePlatform].x, platforms[activePlatform].y);
            }
            else{
                movePlatform(&platforms[activePlatform], 76, platforms[activePlatform].y);
                randomiseValues(TRUE);
            }
            break;
        case RIGHT:
            if((platforms[activePlatform].x <= 255 && platforms[activePlatform].x >= 224) || platforms[activePlatform].x + platformSpeed < 76){
                platforms[activePlatform].x += platformSpeed;
                movePlatform(&platforms[activePlatform], platforms[activePlatform].x, platforms[activePlatform].y);
            }
            else{
                movePlatform(&platforms[activePlatform], 76, platforms[activePlatform].y);
                randomiseValues(TRUE);
            }
            break;
    }
}

void loop(){
    while (1)
    { 
        //check collision before the jump iteration
        if(isCollision()) return;
        
        //Initiate a jump or continue existing jumping
        if((joypad() & J_A) || jumping == 1){
            jump();
        }

        //check collision again after jump iteration
        if(isCollision()) return;
        
        
        moveActivePlatform();    
        
        updateScore();

        performantDelay(5);
        gbt_update();
    }
}

void startBGM(){
    disable_interrupts();
    gbt_play(song_Data, 2, 2);
    gbt_loop(1);

    set_interrupts(VBL_IFLAG);
    enable_interrupts();
}

void playGameOverSFX(){
    playSound(GAME_OVER);
    gbt_stop();
}

void init()
{
    //Initialise globals
    currentSpeedY = 0;
    jumping = 0;
    spriteSize = 8;
    floor = 114;
    platformSpeed = 6;
    platformWaitLength = 4;
    waitCount = 0;
    gameActive = 1;
    score = 0;
    setScore(FALSE);
    // updateScore();
    //This fixes a bug when continuing;
    changeActivePlatform();
    randomiseValues(FALSE);
    // setScore(FALSE);
    updateScore();
    
    //Move the Window layer to the bottom for score.
    set_win_tiles(0,0,11,1, windowmap);
    move_win(7,136);

    //Load Sprites
    set_sprite_data(0,7,Sprites);

    //initialise platforms and player
    initPlatform(0, 76, 100);
    initPlatform(1, 170, 60);
    initPlatform(2, 170, 60);
    initPlatform(3, 170, 60);
    initPlayer(80);


    SHOW_SPRITES;
    DISPLAY_ON;
}

void main()
{
     // these registers must be in this specific order!
    NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
    NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
    NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels

    showLogo();

    loadFonts();
    set_bkg_data(0,55, SplashTiles);
    showStartScreen();
    seedRandom();

    while(1){
        startBGM();
        init();
        loop();
        playGameOverSFX();
        showGameOverScreen();
    }
}