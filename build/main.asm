;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init
	.globl _playGameOverSFX
	.globl _startBGM
	.globl _loop
	.globl _moveActivePlatform
	.globl _activePlatformIsWaiting
	.globl _seedRandom
	.globl _showGameOverScreen
	.globl _showStartScreen
	.globl _showLogo
	.globl _loadFonts
	.globl _randomiseValues
	.globl _changeActivePlatform
	.globl _updateScore
	.globl _setScore
	.globl _getRand
	.globl _updatePlayer
	.globl _jump
	.globl _platformIsUnderPlayer
	.globl _isCollision
	.globl _wouldHitSurface
	.globl _initPlayer
	.globl _initPlatform
	.globl _movePlayer
	.globl _movePlatform
	.globl _playSound
	.globl _performantDelay
	.globl _gbt_update
	.globl _gbt_loop
	.globl _gbt_stop
	.globl _gbt_play
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _rand
	.globl _initrand
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _disable_interrupts
	.globl _enable_interrupts
	.globl _waitpad
	.globl _joypad
	.globl _fontNumBase
	.globl _score
	.globl _gameActive
	.globl _waitCount
	.globl _platformDirection
	.globl _platformWaitLength
	.globl _platformSpeed
	.globl _activePlatform
	.globl _floor
	.globl _spriteSize
	.globl _jumping
	.globl _currentSpeedY
	.globl _player
	.globl _platforms
	.globl _GameOverSplash
	.globl _welcomemap
	.globl _windowmap
	.globl _Sprites
	.globl _BASE_JUMP_SPEED
	.globl _gravity
	.globl _IonicLimbTiles
	.globl _IonicLimbMap
	.globl _SplashTiles
	.globl _Splash
	.globl _gameOverMap
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_Sprites::
	.ds 192
_windowmap::
	.ds 11
_welcomemap::
	.ds 11
_GameOverSplash::
	.ds 360
_platforms::
	.ds 36
_player::
	.ds 9
_currentSpeedY::
	.ds 1
_jumping::
	.ds 1
_spriteSize::
	.ds 1
_floor::
	.ds 1
_activePlatform::
	.ds 1
_platformSpeed::
	.ds 1
_platformWaitLength::
	.ds 1
_platformDirection::
	.ds 1
_waitCount::
	.ds 1
_gameActive::
	.ds 1
_score::
	.ds 2
_fontNumBase::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\/Sprites.c:26: unsigned char Sprites[] =
	ld	hl, #_Sprites
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0001)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0002)
	ld	(hl), #0x80
	ld	hl, #(_Sprites + 0x0003)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0004)
	ld	(hl), #0x80
	ld	hl, #(_Sprites + 0x0005)
	ld	(hl), #0x80
	ld	hl, #(_Sprites + 0x0006)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0007)
	ld	(hl), #0x80
	ld	hl, #(_Sprites + 0x0008)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0009)
	ld	(hl), #0x80
	ld	hl, #(_Sprites + 0x000a)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x000b)
	ld	(hl), #0x80
	ld	hl, #(_Sprites + 0x000c)
	ld	(hl), #0x80
	ld	hl, #(_Sprites + 0x000d)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x000e)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x000f)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0011)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0016)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0018)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x001a)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x001d)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x001e)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x001f)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0020)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0022)
	ld	(hl), #0x01
	ld	hl, #(_Sprites + 0x0023)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0024)
	ld	(hl), #0x01
	ld	hl, #(_Sprites + 0x0025)
	ld	(hl), #0x01
	ld	hl, #(_Sprites + 0x0026)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0027)
	ld	(hl), #0x01
	ld	hl, #(_Sprites + 0x0028)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0029)
	ld	(hl), #0x01
	ld	hl, #(_Sprites + 0x002a)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x002b)
	ld	(hl), #0x01
	ld	hl, #(_Sprites + 0x002c)
	ld	(hl), #0x01
	ld	hl, #(_Sprites + 0x002d)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x002e)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x002f)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0030)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0032)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0034)
	ld	(hl), #0xc3
	ld	hl, #(_Sprites + 0x0035)
	ld	(hl), #0x3c
	ld	hl, #(_Sprites + 0x0036)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0038)
	ld	(hl), #0xf7
	ld	hl, #(_Sprites + 0x0039)
	ld	(hl), #0x10
	ld	hl, #(_Sprites + 0x003a)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x003b)
	ld	(hl), #0x18
	ld	hl, #(_Sprites + 0x003c)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x003d)
	ld	(hl), #0x18
	ld	hl, #(_Sprites + 0x003e)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x003f)
	ld	(hl), #0x18
	ld	hl, #(_Sprites + 0x0040)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0042)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0044)
	ld	(hl), #0xc3
	ld	hl, #(_Sprites + 0x0045)
	ld	(hl), #0x3c
	ld	hl, #(_Sprites + 0x0046)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0048)
	ld	(hl), #0xf7
	ld	hl, #(_Sprites + 0x0049)
	ld	(hl), #0x10
	ld	hl, #(_Sprites + 0x004a)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x004b)
	ld	(hl), #0x18
	ld	hl, #(_Sprites + 0x004c)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x004d)
	ld	(hl), #0x18
	ld	hl, #(_Sprites + 0x004e)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x004f)
	ld	(hl), #0x18
	ld	hl, #(_Sprites + 0x0050)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0052)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0054)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0056)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0058)
	ld	(hl), #0xf8
	ld	hl, #(_Sprites + 0x0059)
	ld	(hl), #0x07
	ld	hl, #(_Sprites + 0x005a)
	ld	(hl), #0xf8
	ld	hl, #(_Sprites + 0x005b)
	ld	(hl), #0x07
	ld	hl, #(_Sprites + 0x005c)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x005e)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0060)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0062)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0064)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0066)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0068)
	ld	(hl), #0x1f
	ld	hl, #(_Sprites + 0x0069)
	ld	(hl), #0xe0
	ld	hl, #(_Sprites + 0x006a)
	ld	(hl), #0x1f
	ld	hl, #(_Sprites + 0x006b)
	ld	(hl), #0xe0
	ld	hl, #(_Sprites + 0x006c)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x006e)
	ld	(hl), #0xff
	ld	hl, #(_Sprites + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00be)
	ld	(hl), #0x00
	ld	hl, #(_Sprites + 0x00bf)
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\/windowmap.c:1: unsigned char windowmap[] =
	ld	hl, #_windowmap
	ld	(hl), #0x20
	ld	hl, #(_windowmap + 0x0001)
	ld	(hl), #0x2d
	ld	hl, #(_windowmap + 0x0002)
	ld	(hl), #0x2e
	ld	hl, #(_windowmap + 0x0003)
	ld	(hl), #0x1e
	ld	hl, #(_windowmap + 0x0004)
	ld	(hl), #0x1f
	ld	hl, #(_windowmap + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_windowmap + 0x0006)
	ld	(hl), #0x23
	ld	hl, #(_windowmap + 0x0007)
	ld	(hl), #0x23
	ld	hl, #(_windowmap + 0x0008)
	ld	(hl), #0x23
	ld	hl, #(_windowmap + 0x0009)
	ld	(hl), #0x23
	ld	hl, #(_windowmap + 0x000a)
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\/welcomemap.c:1: unsigned char welcomemap[] =
	ld	hl, #_welcomemap
	ld	(hl), #0x1a
	ld	hl, #(_welcomemap + 0x0001)
	ld	(hl), #0x1c
	ld	hl, #(_welcomemap + 0x0002)
	ld	(hl), #0x0f
	ld	hl, #(_welcomemap + 0x0003)
	ld	(hl), #0x1d
	ld	hl, #(_welcomemap + 0x0004)
	ld	(hl), #0x1d
	ld	hl, #(_welcomemap + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_welcomemap + 0x0006)
	ld	(hl), #0x1d
	ld	hl, #(_welcomemap + 0x0007)
	ld	(hl), #0x1e
	ld	hl, #(_welcomemap + 0x0008)
	ld	(hl), #0x0b
	ld	hl, #(_welcomemap + 0x0009)
	ld	(hl), #0x1c
	ld	hl, #(_welcomemap + 0x000a)
	ld	(hl), #0x1e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\/GameOverSplash.c:25: unsigned char GameOverSplash[] =
	ld	hl, #_GameOverSplash
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0029)
	ld	(hl), #0x1a
	ld	hl, #(_GameOverSplash + 0x002a)
	ld	(hl), #0x1b
	ld	hl, #(_GameOverSplash + 0x002b)
	ld	(hl), #0x1b
	ld	hl, #(_GameOverSplash + 0x002c)
	ld	(hl), #0x1c
	ld	hl, #(_GameOverSplash + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0044)
	ld	(hl), #0x01
	ld	hl, #(_GameOverSplash + 0x0045)
	ld	(hl), #0x02
	ld	hl, #(_GameOverSplash + 0x0046)
	ld	(hl), #0x03
	ld	hl, #(_GameOverSplash + 0x0047)
	ld	(hl), #0x04
	ld	hl, #(_GameOverSplash + 0x0048)
	ld	(hl), #0x05
	ld	hl, #(_GameOverSplash + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0058)
	ld	(hl), #0x07
	ld	hl, #(_GameOverSplash + 0x0059)
	ld	(hl), #0x08
	ld	hl, #(_GameOverSplash + 0x005a)
	ld	(hl), #0x09
	ld	hl, #(_GameOverSplash + 0x005b)
	ld	(hl), #0x0a
	ld	hl, #(_GameOverSplash + 0x005c)
	ld	(hl), #0x0b
	ld	hl, #(_GameOverSplash + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x006b)
	ld	(hl), #0x0c
	ld	hl, #(_GameOverSplash + 0x006c)
	ld	(hl), #0x0d
	ld	hl, #(_GameOverSplash + 0x006d)
	ld	(hl), #0x0e
	ld	hl, #(_GameOverSplash + 0x006e)
	ld	(hl), #0x0f
	ld	hl, #(_GameOverSplash + 0x006f)
	ld	(hl), #0x10
	ld	hl, #(_GameOverSplash + 0x0070)
	ld	(hl), #0x11
	ld	hl, #(_GameOverSplash + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0073)
	ld	(hl), #0x1a
	ld	hl, #(_GameOverSplash + 0x0074)
	ld	(hl), #0x1b
	ld	hl, #(_GameOverSplash + 0x0075)
	ld	(hl), #0x1b
	ld	hl, #(_GameOverSplash + 0x0076)
	ld	(hl), #0x1c
	ld	hl, #(_GameOverSplash + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x007f)
	ld	(hl), #0x12
	ld	hl, #(_GameOverSplash + 0x0080)
	ld	(hl), #0x13
	ld	hl, #(_GameOverSplash + 0x0081)
	ld	(hl), #0x14
	ld	hl, #(_GameOverSplash + 0x0082)
	ld	(hl), #0x15
	ld	hl, #(_GameOverSplash + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00a9)
	ld	(hl), #0x2f
	ld	hl, #(_GameOverSplash + 0x00aa)
	ld	(hl), #0x30
	ld	hl, #(_GameOverSplash + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00bd)
	ld	(hl), #0x31
	ld	hl, #(_GameOverSplash + 0x00be)
	ld	(hl), #0x32
	ld	hl, #(_GameOverSplash + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00e4)
	ld	(hl), #0x1a
	ld	hl, #(_GameOverSplash + 0x00e5)
	ld	(hl), #0x1b
	ld	hl, #(_GameOverSplash + 0x00e6)
	ld	(hl), #0x1b
	ld	hl, #(_GameOverSplash + 0x00e7)
	ld	(hl), #0x1c
	ld	hl, #(_GameOverSplash + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00fb)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0109)
	ld	(hl), #0x21
	ld	hl, #(_GameOverSplash + 0x010a)
	ld	(hl), #0x1e
	ld	hl, #(_GameOverSplash + 0x010b)
	ld	(hl), #0x33
	ld	hl, #(_GameOverSplash + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x010e)
	ld	(hl), #0x22
	ld	hl, #(_GameOverSplash + 0x010f)
	ld	(hl), #0x34
	ld	hl, #(_GameOverSplash + 0x0110)
	ld	(hl), #0x22
	ld	hl, #(_GameOverSplash + 0x0111)
	ld	(hl), #0x35
	ld	hl, #(_GameOverSplash + 0x0112)
	ld	(hl), #0x36
	ld	hl, #(_GameOverSplash + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0130)
	ld	(hl), #0x1d
	ld	hl, #(_GameOverSplash + 0x0131)
	ld	(hl), #0x1e
	ld	hl, #(_GameOverSplash + 0x0132)
	ld	(hl), #0x1f
	ld	hl, #(_GameOverSplash + 0x0133)
	ld	(hl), #0x20
	ld	hl, #(_GameOverSplash + 0x0134)
	ld	(hl), #0x20
	ld	hl, #(_GameOverSplash + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0137)
	ld	(hl), #0x20
	ld	hl, #(_GameOverSplash + 0x0138)
	ld	(hl), #0x21
	ld	hl, #(_GameOverSplash + 0x0139)
	ld	(hl), #0x22
	ld	hl, #(_GameOverSplash + 0x013a)
	ld	(hl), #0x1e
	ld	hl, #(_GameOverSplash + 0x013b)
	ld	(hl), #0x21
	ld	hl, #(_GameOverSplash + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0154)
	ld	(hl), #0x20
	ld	hl, #(_GameOverSplash + 0x0155)
	ld	(hl), #0x2d
	ld	hl, #(_GameOverSplash + 0x0156)
	ld	(hl), #0x2e
	ld	hl, #(_GameOverSplash + 0x0157)
	ld	(hl), #0x1e
	ld	hl, #(_GameOverSplash + 0x0158)
	ld	(hl), #0x1f
	ld	hl, #(_GameOverSplash + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x015a)
	ld	(hl), #0x23
	ld	hl, #(_GameOverSplash + 0x015b)
	ld	(hl), #0x23
	ld	hl, #(_GameOverSplash + 0x015c)
	ld	(hl), #0x23
	ld	hl, #(_GameOverSplash + 0x015d)
	ld	(hl), #0x23
	ld	hl, #(_GameOverSplash + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_GameOverSplash + 0x0167)
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:28: BYTE jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:29: UBYTE spriteSize = 8;
	ld	hl, #_spriteSize
	ld	(hl), #0x08
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:30: INT8 floor = 114;
	ld	hl, #_floor
	ld	(hl), #0x72
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:33: UINT8 activePlatform = 1;
	ld	hl, #_activePlatform
	ld	(hl), #0x01
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:34: UINT8 platformSpeed = 4;
	ld	hl, #_platformSpeed
	ld	(hl), #0x04
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:35: UINT8 platformWaitLength = 4;
	ld	hl, #_platformWaitLength
	ld	(hl), #0x04
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:36: enum PlatformDirection platformDirection = LEFT;
	ld	hl, #_platformDirection
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:37: UINT8 waitCount = 0;
	ld	hl, #_waitCount
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:38: UBYTE gameActive = 1;
	ld	hl, #_gameActive
	ld	(hl), #0x01
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:39: UINT16 score = 0;
	ld	hl, #_score
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:310: UINT8 fontNumBase = 0x01;
	ld	hl, #_fontNumBase
	ld	(hl), #0x01
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:41: void performantDelay(UINT8 numloops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:44: for(i=0; i<numloops;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:45: wait_vbl_done();
	call	_wait_vbl_done
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:44: for(i=0; i<numloops;i++){
	inc	c
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:47: }
	jr	00103$
_gameOverMap:
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1a	; 26
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x1d	; 29
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x0b	; 11
	.db #0x1c	; 28
	.db #0x1e	; 30
_Splash:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x17	; 23
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_SplashTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x4e	; 78	'N'
	.db #0x4e	; 78	'N'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x00	; 0
_IonicLimbMap:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x49	; 73	'I'
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x0b	; 11
	.db #0x4b	; 75	'K'
	.db #0x0b	; 11
	.db #0x4c	; 76	'L'
	.db #0x4d	; 77	'M'
	.db #0x0b	; 11
	.db #0x4e	; 78	'N'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x0b	; 11
	.db #0x53	; 83	'S'
	.db #0x0b	; 11
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x0b	; 11
	.db #0x5b	; 91
	.db #0x0b	; 11
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x0b	; 11
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x6d	; 109	'm'
	.db #0x00	; 0
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x6e	; 110	'n'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_IonicLimbTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x27	; 39
	.db #0x27	; 39
	.db #0x16	; 22
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x16	; 22
	.db #0x16	; 22
	.db #0x2c	; 44
	.db #0x2c	; 44
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x67	; 103	'g'
	.db #0x67	; 103	'g'
	.db #0x58	; 88	'X'
	.db #0x58	; 88	'X'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x48	; 72	'H'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xc2	; 194
	.db #0xe2	; 226
	.db #0xe2	; 226
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0xc4	; 196
	.db #0xc4	; 196
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x86	; 134
	.db #0x86	; 134
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x19	; 25
	.db #0x19	; 25
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x8d	; 141
	.db #0x8d	; 141
	.db #0xc5	; 197
	.db #0xc5	; 197
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xe1	; 225
	.db #0xe1	; 225
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0xd1	; 209
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x91	; 145
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x11	; 17
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x83	; 131
	.db #0x83	; 131
	.db #0x41	; 65	'A'
	.db #0x41	; 65	'A'
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0xa1	; 161
	.db #0x99	; 153
	.db #0x99	; 153
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x46	; 70	'F'
	.db #0x46	; 70	'F'
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x62	; 98	'b'
	.db #0x62	; 98	'b'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x84	; 132
	.db #0x84	; 132
	.db #0x79	; 121	'y'
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
_gravity:
	.db #0xfe	; -2
_BASE_JUMP_SPEED:
	.db #0x0f	;  15
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:49: void playSound(enum Sound sound){
;	---------------------------------
; Function playSound
; ---------------------------------
_playSound::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:50: switch(sound){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00103$
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:51: case JUMP:
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:52: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:53: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:54: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:55: NR13_REG = 0x00;   
	ld	a, #0x00
	ldh	(_NR13_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:56: NR14_REG = 0xC3;	        
	ld	a, #0xc3
	ldh	(_NR14_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:57: break;
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:58: case GAME_OVER:
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:59: NR10_REG = 0x79;
	ld	a, #0x79
	ldh	(_NR10_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:60: NR11_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR11_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:61: NR12_REG = 0x54;
	ld	a, #0x54
	ldh	(_NR12_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:62: NR13_REG = 0x73;
	ld	a, #0x73
	ldh	(_NR13_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:63: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:64: break;
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:65: case LOGO:
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:66: NR10_REG = 0x7f;
	ld	a, #0x7f
	ldh	(_NR10_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:67: NR11_REG = 0xbf;
	ld	a, #0xbf
	ldh	(_NR11_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:68: NR12_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR12_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:69: NR13_REG = 0x37;
	ld	a, #0x37
	ldh	(_NR13_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:70: NR14_REG = 0x87;
	ld	a, #0x87
	ldh	(_NR14_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:72: }
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:73: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:75: void movePlatform(struct MetaSprite* platform, UINT8 x, UINT8 y)
;	---------------------------------
; Function movePlatform
; ---------------------------------
_movePlatform::
	add	sp, #-3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:77: move_sprite(platform->spriteIds[0], x, y);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:78: move_sprite(platform->spriteIds[1], x + spriteSize, y);
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, c
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:79: move_sprite(platform->spriteIds[2], x + (spriteSize * 2), y);
	ld	a, (#_spriteSize)
	add	a, a
	ldhl	sp,	#1
	ld	c, (hl)
	add	a, c
	ld	c, a
	inc	de
	inc	de
	ld	a, (de)
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:79: move_sprite(platform->spriteIds[2], x + (spriteSize * 2), y);
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:80: }
	add	sp, #3
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:82: void movePlayer(struct MetaSprite* player, UINT8 x, UINT8 y)
;	---------------------------------
; Function movePlayer
; ---------------------------------
_movePlayer::
	add	sp, #-3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:84: move_sprite(player->spriteIds[0], x, y);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:85: move_sprite(player->spriteIds[1], x + spriteSize, y);
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	ld	c, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, c
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:86: move_sprite(player->spriteIds[2], x, y + spriteSize);
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	dec	hl
	ld	a, (hl)
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:87: move_sprite(player->spriteIds[3], x + spriteSize, y + spriteSize);
	dec	hl
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ld	b, a
	ldhl	sp,	#1
	ld	a, (hl)
	ld	hl, #_spriteSize
	add	a, (hl)
	ld	c, a
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
;P:/_lib/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;P:/_lib/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:87: move_sprite(player->spriteIds[3], x + spriteSize, y + spriteSize);
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:88: }
	add	sp, #3
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:90: void initPlatform(UINT8 id, UINT8 x, UINT8 y)
;	---------------------------------
; Function initPlatform
; ---------------------------------
_initPlatform::
	dec	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:92: platforms[id].x = x; //76
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_platforms
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:93: platforms[id].y = y; //130
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:94: platforms[id].width = 24;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x18
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:95: platforms[id].height = 8;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x08
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:96: platforms[id].yAtJump = y;
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:97: set_sprite_tile(5 + (id * 3),0);
	dec	hl
	dec	hl
	ld	a, (hl)
	ld	e, a
	add	a, a
	add	a, e
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (hl)
	add	a, #0x05
	ld	e, a
	ld	d, e
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:98: platforms[id].spriteIds[0] = 5 + (id * 3);
	ld	a, e
	ld	(bc), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:99: set_sprite_tile(6 + (id * 3),1);
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x06
	ld	e, a
	ld	d, e
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	ld	(hl), #0x01
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:100: platforms[id].spriteIds[1] = 6 + (id * 3);
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:101: set_sprite_tile(7 + (id * 3),2);
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x07
	ld	e, a
	ld	d, e
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
	ld	l, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
	inc	hl
	inc	hl
	ld	(hl), #0x02
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:102: platforms[id].spriteIds[2] = 7 + (id * 3);
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:104: movePlatform(&platforms[id], platforms[id].x, platforms[id].y);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	dec	hl
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_movePlatform
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:105: }
	inc	sp
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:107: void initPlayer(UINT8 x)
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:109: player.x = x;
	ld	bc, #_player+0
	ld	de, #(_player + 0x0004)
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:110: player.y = 84;
	ld	hl, #(_player + 0x0005)
	ld	(hl), #0x54
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:111: player.width = 16;
	ld	hl, #(_player + 0x0006)
	ld	(hl), #0x10
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:112: player.height = 16;
	ld	hl, #(_player + 0x0007)
	ld	(hl), #0x10
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x03
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:114: player.spriteIds[0] = 1;
	ld	a, #0x01
	ld	(bc), a
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x04
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:116: player.spriteIds[1] = 2;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x02
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), #0x05
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:118: player.spriteIds[2] = 3;
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x03
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0012)
	ld	(hl), #0x06
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:120: player.spriteIds[3] = 4;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x04
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:122: movePlayer(&player, player.x, player.y);
	ld	a, (#(_player + 0x0005) + 0)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_movePlayer
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:123: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:125: INT8 wouldHitSurface(struct MetaSprite* platform)
;	---------------------------------
; Function wouldHitSurface
; ---------------------------------
_wouldHitSurface::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:127: if(platform->y <= platform->yAtJump){
	pop	bc
	pop	de
	push	de
	push	bc
	ld	hl, #0x0005
	add	hl, de
	ld	c, (hl)
	ld	hl, #0x0008
	add	hl, de
	ld	e, (hl)
	ld	a, e
	sub	a, c
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:128: return platform->yAtJump;
	ret	NC
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:130: return -1;
	ld	e, #0xff
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:131: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:133: BOOLEAN isCollision(){
;	---------------------------------
; Function isCollision
; ---------------------------------
_isCollision::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:134: if(platforms[activePlatform].y < 100){
	ld	hl, #_activePlatform
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_platforms
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x64
	jr	NC, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:137: return platforms[activePlatform].x < 96;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:135: switch(platformDirection){
	ld	a, (#_platformDirection)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_platformDirection)
	dec	a
	jr	Z, 00102$
	jr	00103$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:136: case LEFT:
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:137: return platforms[activePlatform].x < 96;
	ld	a, (bc)
	sub	a, #0x60
	ld	a, #0x00
	rla
	ld	e, a
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:138: case RIGHT:
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:139: return platforms[activePlatform].x > 56 && platforms[activePlatform].x < 240;
	ld	a, (bc)
	ld	c, a
	ld	a, #0x38
	sub	a, c
	jr	NC, 00109$
	ld	a, c
	sub	a, #0xf0
	jr	C, 00110$
00109$:
	ld	e, #0x00
	ret
00110$:
	ld	e, #0x01
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:140: default: 
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:141: return 0;
	ld	e, #0x00
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:142: }
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:144: return 0;
	ld	e, #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:145: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:147: BOOLEAN platformIsUnderPlayer(){
;	---------------------------------
; Function platformIsUnderPlayer
; ---------------------------------
_platformIsUnderPlayer::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:148: if(platforms[activePlatform].y <= 102){
	ld	hl, #_activePlatform
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_platforms
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0005
	add	hl, bc
	ld	e, (hl)
	ld	a, #0x66
	sub	a, e
	jr	C, 00106$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:151: return platforms[activePlatform].x < 90;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:149: switch(platformDirection){
	ld	a, (#_platformDirection)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_platformDirection)
	dec	a
	jr	Z, 00102$
	jr	00103$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:150: case LEFT:
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:151: return platforms[activePlatform].x < 90;
	ld	a, (bc)
	sub	a, #0x5a
	ld	a, #0x00
	rla
	ld	e, a
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:152: case RIGHT:
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:153: return platforms[activePlatform].x > 62 && platforms[activePlatform].x < 240;
	ld	a, (bc)
	ld	c, a
	ld	a, #0x3e
	sub	a, c
	jr	NC, 00109$
	ld	a, c
	sub	a, #0xf0
	jr	C, 00110$
00109$:
	ld	e, #0x00
	ret
00110$:
	ld	e, #0x01
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:154: default: 
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:155: return 0;
	ld	e, #0x00
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:156: }
00106$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:158: return 0;
	ld	e, #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:159: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:161: void jump()
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
	add	sp, #-4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:165: if(jumping == 0) {
	ld	a, (#_jumping)
	or	a, a
	jr	NZ, 00103$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:166: playSound(JUMP);    
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:167: jumping = 1;
	ld	hl, #_jumping
	ld	(hl), #0x01
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:168: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
	ld	c, #0x00
00113$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00101$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:170: platforms[i].yAtJump = platforms[i].y;
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	de, #_platforms
	add	hl, de
	ld	a, l
	add	a, #0x08
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(de), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:168: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
	inc	c
	jr	00113$
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:172: currentSpeedY = BASE_JUMP_SPEED;
	ld	a, (#_BASE_JUMP_SPEED)
	ld	(#_currentSpeedY),a
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:174: currentSpeedY = currentSpeedY + gravity;
	ld	hl, #_gravity
	ld	e, (hl)
	ld	hl, #_currentSpeedY
	ld	a, (hl)
	add	a, e
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:175: if(currentSpeedY < -(BASE_JUMP_SPEED - gravity)) currentSpeedY = 0;
	ld	a, (#_BASE_JUMP_SPEED)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	xor	a, a
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	a, (#_currentSpeedY)
	ldhl	sp,	#2
	ld	(hl), a
	rla
	sbc	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	ld	e, a
	bit	7, e
	jr	Z, 00162$
	bit	7, d
	jr	NZ, 00163$
	cp	a, a
	jr	00163$
00162$:
	bit	7, d
	jr	Z, 00163$
	scf
00163$:
	jr	NC, 00127$
	ld	hl, #_currentSpeedY
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:177: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
00127$:
	xor	a, a
	ldhl	sp,	#3
	ld	(hl), a
00116$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00118$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:179: if(platformIsUnderPlayer()){
	call	_platformIsUnderPlayer
	push	hl
	ldhl	sp,	#4
	ld	(hl), e
	pop	hl
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:180: platforms[i].yAtJump = 100;
	ldhl	sp,	#3
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:179: if(platformIsUnderPlayer()){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:180: platforms[i].yAtJump = 100;
	ld	hl, #_platforms
	add	hl, bc
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x64
00107$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:182: platforms[i].y += currentSpeedY;    
	ld	hl, #_platforms
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	hl, #_currentSpeedY
	add	a, (hl)
	ldhl	sp,	#1
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:183: possibleSurfaceY = wouldHitSurface(&platforms[i]);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_wouldHitSurface
	add	sp, #2
	pop	bc
	ldhl	sp,	#0
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:184: if(currentSpeedY == 0 || possibleSurfaceY > -1){
	ld	a, (#_currentSpeedY)
	or	a, a
	jr	Z, 00108$
	ldhl	sp,	#0
	ld	e, (hl)
	ld	a,#0xff
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00164$
	bit	7, d
	jr	NZ, 00165$
	cp	a, a
	jr	00165$
00164$:
	bit	7, d
	jr	Z, 00165$
	scf
00165$:
	jr	NC, 00109$
00108$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:186: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:187: platforms[i].y = platforms[i].yAtJump;
	ld	hl, #0x0008
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#1
	push	af
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
00109$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:189: movePlatform(&platforms[i], platforms[i].x, platforms[i].y);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#2
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_movePlatform
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:177: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
	ldhl	sp,	#3
	inc	(hl)
	jp	00116$
00118$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:191: }
	add	sp, #4
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:193: void updatePlayer()
;	---------------------------------
; Function updatePlayer
; ---------------------------------
_updatePlayer::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:195: movePlayer(&player, player.x, player.y);
	ld	hl, #_player + 5
	ld	b, (hl)
	ld	hl, #_player + 4
	ld	c, (hl)
	push	bc
	ld	hl, #_player
	push	hl
	call	_movePlayer
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:196: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:198: UINT8 getRand(UINT8 min, UINT8 max){
;	---------------------------------
; Function getRand
; ---------------------------------
_getRand::
	dec	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:199: return (((UINT8)rand()) % ((UINT8)max + (UINT8) 1 - min)) + min;
	call	_rand
	ldhl	sp,	#0
	ld	(hl), e
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	dec	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
	ldhl	sp,	#0
	ld	c, (hl)
	ld	b, #0x00
	push	de
	push	bc
	call	__modsint
	add	sp, #4
	ldhl	sp,	#3
	ld	a, (hl)
	add	a, e
	ld	e, a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:200: }
	inc	sp
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:202: void setScore(BOOLEAN increment){
;	---------------------------------
; Function setScore
; ---------------------------------
_setScore::
	add	sp, #-3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:203: if(increment) score++;
	ldhl	sp,	#5
	ld	a, (hl)
	or	a, a
	jr	Z, 00122$
	ld	hl, #_score
	inc	(hl)
	jr	NZ, 00156$
	inc	hl
	inc	(hl)
00156$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:204: for (UINT8 i = 0; i < 4; i++)
00122$:
	ld	c, #0x00
00116$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:206: windowmap[6+i] = (unsigned char) (0x23);
	ld	a,c
	cp	a,#0x04
	jr	NC, 00103$
	add	a, #0x06
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_windowmap
	add	hl, de
	ld	(hl), #0x23
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:204: for (UINT8 i = 0; i < 4; i++)
	inc	c
	jr	00116$
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:210: windowmap[9] = (unsigned char) (0x23 + score);
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:209: if(score < 10){  
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00113$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:210: windowmap[9] = (unsigned char) (0x23 + score);
	ld	a, (#_score)
	add	a, #0x23
	ld	(#(_windowmap + 0x0009)),a
	jp	00118$
00113$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:214: UINT8 ones = score % 10;
	ld	hl, #0x000a
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:215: windowmap[8] = (unsigned char) (0x23 + tens);
	call	__moduint
	add	sp, #4
	ld	c, e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:214: UINT8 ones = score % 10;
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:212: else if(score < 100){
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00110$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:213: UINT8 tens = score / 10;
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__divuint
	add	sp, #4
	pop	bc
	ld	a, e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:214: UINT8 ones = score % 10;
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:215: windowmap[8] = (unsigned char) (0x23 + tens);
	add	a, #0x23
	ld	(#(_windowmap + 0x0008)),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:216: windowmap[9] = (unsigned char) (0x23 + ones);
	ld	a, c
	add	a, #0x23
	ld	(#(_windowmap + 0x0009)),a
	jp	00118$
00110$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:220: UINT8 tens = (score % 100) / 10;
	push	bc
	ld	hl, #0x0064
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:222: windowmap[7] = (unsigned char) (0x23 + huns);
	call	__moduint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divuint
	add	sp, #4
	pop	bc
	ld	b, e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:218: else if(score < 1000){
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00107$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:219: UINT8 huns = score / 100;
	push	bc
	ld	hl, #0x0064
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__divuint
	add	sp, #4
	pop	bc
	ld	a, e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:220: UINT8 tens = (score % 100) / 10;
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:221: UINT8 ones = score % 10;
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:222: windowmap[7] = (unsigned char) (0x23 + huns);
	add	a, #0x23
	ld	(#(_windowmap + 0x0007)),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:223: windowmap[8] = (unsigned char) (0x23 + tens);
	ld	a, b
	add	a, #0x23
	ld	(#(_windowmap + 0x0008)),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:224: windowmap[9] = (unsigned char) (0x23 + ones);
	ld	a, c
	add	a, #0x23
	ld	(#(_windowmap + 0x0009)),a
	jr	00118$
00107$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:226: else if(score < 10000){
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0x10
	inc	hl
	ld	a, (hl)
	sbc	a, #0x27
	jr	NC, 00118$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:227: UINT8 thous = score / 1000;
	push	bc
	ld	hl, #0x03e8
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__divuint
	add	sp, #4
	pop	bc
	ldhl	sp,	#0
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:228: UINT8 huns = (score % 1000) / 100;
	push	bc
	ld	hl, #0x03e8
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	call	__moduint
	add	sp, #4
	ld	hl, #0x0064
	push	hl
	push	de
	call	__divuint
	add	sp, #4
	pop	bc
	ldhl	sp,	#1
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:229: UINT8 tens = (score % 100) / 10;
	ld	a, e
	ld	(hl+), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:230: UINT8 ones = score % 10;
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:231: windowmap[6] = (unsigned char) (0x23 + thous);
	ld	a, b
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	add	a, #0x23
	ld	(#(_windowmap + 0x0006)),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:232: windowmap[7] = (unsigned char) (0x23 + huns);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x23
	ld	(#(_windowmap + 0x0007)),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:233: windowmap[8] = (unsigned char) (0x23 + tens);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x23
	ld	(#(_windowmap + 0x0008)),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:234: windowmap[9] = (unsigned char) (0x23 + ones);
	ld	a, c
	add	a, #0x23
	ld	(#(_windowmap + 0x0009)),a
00118$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:236: }
	add	sp, #3
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:238: void updateScore(){
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:239: set_win_tiles(0,0,11,1, windowmap);
	ld	hl, #_windowmap
	push	hl
	ld	de, #0x010b
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;P:/_lib/gbdk/include/gb/gb.h:1015: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x88
	ldh	(_WY_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:240: move_win(7,136);
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:241: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:243: void changeActivePlatform(){
;	---------------------------------
; Function changeActivePlatform
; ---------------------------------
_changeActivePlatform::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:244: activePlatform = activePlatform + 1 > 3 ? 0 : activePlatform + 1;
	ld	hl, #_activePlatform
	ld	c, (hl)
	ld	b, #0x00
	inc	bc
	ld	e, b
	ld	d, #0x00
	ld	a, #0x03
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	bit	7, e
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	jr	NC, 00103$
	ld	bc, #0x0000
	jr	00104$
00103$:
	ld	a, (#_activePlatform)
	inc	a
	ld	c, a
	rla
00104$:
	ld	hl, #_activePlatform
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:245: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:247: void randomiseValues(BOOLEAN incrementScore){
;	---------------------------------
; Function randomiseValues
; ---------------------------------
_randomiseValues::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:248: if(platforms[activePlatform].y == 100){
	ld	hl, #_activePlatform
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_platforms
	add	hl,bc
	ld	bc, #0x0005
	add	hl, bc
	ld	a, (hl)
	sub	a, #0x64
	ret	NZ
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:249: waitCount = 0;
	ld	hl, #_waitCount
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:250: platformWaitLength = getRand(2,15); 
	ld	de, #0x0f02
	push	de
	call	_getRand
	add	sp, #2
	ld	hl, #_platformWaitLength
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:251: platformSpeed = getRand(8,10);
	ld	de, #0x0a08
	push	de
	call	_getRand
	add	sp, #2
	ld	hl, #_platformSpeed
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:252: platformDirection = getRand(0,1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_getRand
	add	sp, #2
	ld	hl, #_platformDirection
	ld	(hl), e
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:253: initPlatform(activePlatform, 76, 100);
	ld	de, #0x644c
	push	de
	ld	a, (#_activePlatform)
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:255: changeActivePlatform();
	call	_changeActivePlatform
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:257: UINT8 x = platformDirection ? 0xF0 : 170; 
	ld	hl, #_platformDirection
	ld	a, (hl)
	or	a, a
	jr	Z, 00105$
	ld	bc, #0x00f0
	jr	00106$
00105$:
	ld	bc, #0x00aa
00106$:
	ld	a, c
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:258: initPlatform(activePlatform, x, 60);
	ld	h, #0x3c
	push	hl
	inc	sp
	push	af
	inc	sp
	ld	a, (#_activePlatform)
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:259: setScore(incrementScore);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_setScore
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:261: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:263: void loadFonts(){
;	---------------------------------
; Function loadFonts
; ---------------------------------
_loadFonts::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:266: font_init();
	call	_font_init
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:267: min_font = font_load(font_min);
	ld	hl, #_font_min
	push	hl
	call	_font_load
	add	sp, #2
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:268: font_set(min_font);
	push	de
	call	_font_set
	add	sp, #2
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:269: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:271: void showLogo(){
;	---------------------------------
; Function showLogo
; ---------------------------------
_showLogo::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:272: set_bkg_data(0,120, IonicLimbTiles);
	ld	hl, #_IonicLimbTiles
	push	hl
	ld	a, #0x78
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:273: set_bkg_tiles(0,0,20,18, IonicLimbMap);
	ld	hl, #_IonicLimbMap
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;P:/_lib/gbdk/include/gb/gb.h:1015: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x00
	ldh	(_WY_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:275: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:276: playSound(LOGO);
	ld	a, #0x02
	push	af
	inc	sp
	call	_playSound
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:277: performantDelay(200);
	ld	a, #0xc8
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:278: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:280: void showStartScreen(){
;	---------------------------------
; Function showStartScreen
; ---------------------------------
_showStartScreen::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:281: set_win_tiles(0,0,20,18, Splash);
	ld	hl, #_Splash
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;P:/_lib/gbdk/include/gb/gb.h:1015: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x00
	ldh	(_WY_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:283: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:284: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:285: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:287: void showGameOverScreen(){
;	---------------------------------
; Function showGameOverScreen
; ---------------------------------
_showGameOverScreen::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:288: for (UINT8 i = 0; i < 4; i++)
	ld	c, #0x00
00104$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:290: GameOverSplash[346+i] = windowmap[6+i];
	ld	a,c
	cp	a,#0x04
	jr	NC, 00101$
	ld	h, #0x00
	ld	l, a
	ld	de, #0x015a
	add	hl, de
	ld	de, #_GameOverSplash
	add	hl, de
	ld	a, c
	add	a, #0x06
	push	af
	rla
	sbc	a, a
	ld	b, a
	pop	af
	add	a, #<(_windowmap)
	ld	e, a
	ld	a, b
	adc	a, #>(_windowmap)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:288: for (UINT8 i = 0; i < 4; i++)
	inc	c
	jr	00104$
00101$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:293: initPlatform(0, 170, 100);
	ld	de, #0x64aa
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:294: initPlatform(1, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:295: initPlatform(2, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:296: initPlatform(3, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:297: initPlayer(170);
	ld	a, #0xaa
	push	af
	inc	sp
	call	_initPlayer
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:298: set_win_tiles(0,0,20,18, GameOverSplash);
	ld	hl, #_GameOverSplash
	push	hl
	ld	de, #0x1214
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;P:/_lib/gbdk/include/gb/gb.h:1015: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x00
	ldh	(_WY_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:300: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:301: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:302: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:304: void seedRandom(){
;	---------------------------------
; Function seedRandom
; ---------------------------------
_seedRandom::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:305: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG+0)
	ld	c, a
	ld	b, #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:306: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG+0)
	ld	e, a
	ld	a, #0x00
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:307: initrand(seed);
	push	bc
	call	_initrand
	add	sp, #2
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:308: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:312: BOOLEAN activePlatformIsWaiting(){
;	---------------------------------
; Function activePlatformIsWaiting
; ---------------------------------
_activePlatformIsWaiting::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:313: if(waitCount < platformWaitLength){
	ld	a, (#_waitCount)
	ld	hl, #_platformWaitLength
	sub	a, (hl)
	jr	NC, 00102$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:314: waitCount++;
	ld	hl, #_waitCount
	inc	(hl)
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:315: return 1;
	ld	e, #0x01
	ret
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:317: return 0;
	ld	e, #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:318: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:320: void moveActivePlatform(){
;	---------------------------------
; Function moveActivePlatform
; ---------------------------------
_moveActivePlatform::
	add	sp, #-9
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:321: if(activePlatformIsWaiting()) return;
	call	_activePlatformIsWaiting
	ld	a, e
	or	a, a
	jp	NZ,00114$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:325: if(platforms[activePlatform].x - platformSpeed > 76){
	ld	hl, #_activePlatform
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl), a
	ld	a, (#_platformSpeed)
	ldhl	sp,	#0
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl), a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:323: switch(platformDirection){
	ld	a, (#_platformDirection)
	or	a, a
	jr	Z, 00103$
	ld	a, (#_platformDirection)
	dec	a
	jp	Z,00111$
	jp	00114$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:324: case LEFT:
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:325: if(platforms[activePlatform].x - platformSpeed > 76){
;c
	ld	de, #_platforms
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	xor	a, a
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	pop	hl
	push	hl
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	(hl), e
	ld	a, #0x4c
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00143$
	bit	7, d
	jr	NZ, 00144$
	cp	a, a
	jr	00144$
00143$:
	bit	7, d
	jr	Z, 00144$
	scf
00144$:
	jr	NC, 00105$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:326: platforms[activePlatform].x -= platformSpeed;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	hl, #_platformSpeed
	sub	a, (hl)
	ld	c, a
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:327: movePlatform(&platforms[activePlatform], platforms[activePlatform].x, platforms[activePlatform].y);
	ld	hl, #_activePlatform
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_platforms
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	push	de
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_movePlatform
	add	sp, #4
	jp	00114$
00105$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:330: movePlatform(&platforms[activePlatform], 76, platforms[activePlatform].y);
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	e,#0x4c
	push	de
	push	bc
	call	_movePlatform
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:331: randomiseValues(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_randomiseValues
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:333: break;
	jp	00114$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:335: if((platforms[activePlatform].x <= 255 && platforms[activePlatform].x >= 224) || platforms[activePlatform].x + platformSpeed < 76){
00111$:
;c
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_platforms
	add	hl, de
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	inc	hl
	ld	(hl), a
	sub	a, #0xe0
	jr	NC, 00108$
	ld	e, (hl)
	ld	d, #0x00
;c
	pop	hl
	push	hl
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl)
	sub	a, #0x4c
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	ld	e, a
	bit	7, e
	jr	Z, 00145$
	bit	7, d
	jr	NZ, 00146$
	cp	a, a
	jr	00146$
00145$:
	bit	7, d
	jr	Z, 00146$
	scf
00146$:
	jr	NC, 00109$
00108$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:336: platforms[activePlatform].x += platformSpeed;
	ldhl	sp,	#6
	ld	a, (hl)
	ld	hl, #_platformSpeed
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:337: movePlatform(&platforms[activePlatform], platforms[activePlatform].x, platforms[activePlatform].y);
	ld	hl, #_activePlatform
	ld	c, (hl)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	bc,#_platforms
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	push	de
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_movePlatform
	add	sp, #4
	jr	00114$
00109$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:340: movePlatform(&platforms[activePlatform], 76, platforms[activePlatform].y);
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	e,#0x4c
	push	de
	push	bc
	call	_movePlatform
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:341: randomiseValues(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_randomiseValues
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:344: }
00114$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:345: }
	add	sp, #9
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:347: void loop(){
;	---------------------------------
; Function loop
; ---------------------------------
_loop::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:348: while (1)
00109$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:351: if(isCollision()) return;
	call	_isCollision
	ld	a, e
	or	a, a
	ret	NZ
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:354: if((joypad() & J_A) || jumping == 1){
	call	_joypad
	bit	4, e
	jr	NZ, 00103$
	ld	a, (#_jumping)
	dec	a
	jr	NZ, 00104$
00103$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:355: jump();
	call	_jump
00104$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:359: if(isCollision()) return;
	call	_isCollision
	ld	a, e
	or	a, a
	ret	NZ
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:362: moveActivePlatform();    
	call	_moveActivePlatform
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:364: updateScore();
	call	_updateScore
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:366: performantDelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:367: gbt_update();
	call	_gbt_update
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:369: }
	jr	00109$
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:371: void startBGM(){
;	---------------------------------
; Function startBGM
; ---------------------------------
_startBGM::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:372: disable_interrupts();
	call	_disable_interrupts
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:373: gbt_play(song_Data, 2, 2);
	ld	de, #0x0202
	push	de
	ld	hl, #_song_Data
	push	hl
	call	_gbt_play
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:374: gbt_loop(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_gbt_loop
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:376: set_interrupts(VBL_IFLAG);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:377: enable_interrupts();
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:378: }
	jp  _enable_interrupts
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:380: void playGameOverSFX(){
;	---------------------------------
; Function playGameOverSFX
; ---------------------------------
_playGameOverSFX::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:381: playSound(GAME_OVER);
	ld	a, #0x01
	push	af
	inc	sp
	call	_playSound
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:382: gbt_stop();
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:383: }
	jp  _gbt_stop
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:385: void init()
;	---------------------------------
; Function init
; ---------------------------------
_init::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:388: currentSpeedY = 0;
	ld	hl, #_currentSpeedY
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:389: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:390: spriteSize = 8;
	ld	hl, #_spriteSize
	ld	(hl), #0x08
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:391: floor = 114;
	ld	hl, #_floor
	ld	(hl), #0x72
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:392: platformSpeed = 6;
	ld	hl, #_platformSpeed
	ld	(hl), #0x06
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:393: platformWaitLength = 4;
	ld	hl, #_platformWaitLength
	ld	(hl), #0x04
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:394: waitCount = 0;
	ld	hl, #_waitCount
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:395: gameActive = 1;
	ld	hl, #_gameActive
	ld	(hl), #0x01
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:396: score = 0;
	ld	hl, #_score
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:397: setScore(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_setScore
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:400: changeActivePlatform();
	call	_changeActivePlatform
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:401: randomiseValues(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_randomiseValues
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:403: updateScore();
	call	_updateScore
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:406: set_win_tiles(0,0,11,1, windowmap);
	ld	hl, #_windowmap
	push	hl
	ld	de, #0x010b
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_win_tiles
	add	sp, #6
;P:/_lib/gbdk/include/gb/gb.h:1015: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG+0),a
	ld	a, #0x88
	ldh	(_WY_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:410: set_sprite_data(0,7,Sprites);
	ld	hl, #_Sprites
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:413: initPlatform(0, 76, 100);
	ld	de, #0x644c
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:414: initPlatform(1, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:415: initPlatform(2, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:416: initPlatform(3, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:417: initPlayer(80);
	ld	a, #0x50
	push	af
	inc	sp
	call	_initPlayer
	inc	sp
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:420: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:421: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:422: }
	ret
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:424: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:427: NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:428: NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:429: NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
	ld	a, #0xff
	ldh	(_NR51_REG+0),a
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:431: showLogo();
	call	_showLogo
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:433: loadFonts();
	call	_loadFonts
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:434: set_bkg_data(0,55, SplashTiles);
	ld	hl, #_SplashTiles
	push	hl
	ld	a, #0x37
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:435: showStartScreen();
	call	_showStartScreen
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:436: seedRandom();
	call	_seedRandom
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:438: while(1){
00102$:
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:439: startBGM();
	call	_startBGM
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:440: init();
	call	_init
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:441: loop();
	call	_loop
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:442: playGameOverSFX();
	call	_playGameOverSFX
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:443: showGameOverScreen();
	call	_showGameOverScreen
;P:\04_Computer_Science\C_CPP\Gameboy\00_jp_up\main.c:445: }
	jr	00102$
	.area _CODE
	.area _CABS (ABS)
