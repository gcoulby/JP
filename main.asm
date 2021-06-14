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
	.globl _SplashTiles
	.globl _Splash
	.globl _welcomemap
	.globl _gameOverMap
	.globl _windowmap
	.globl _Sprites
	.globl _BASE_JUMP_SPEED
	.globl _gravity
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
_gameOverMap::
	.ds 22
_welcomemap::
	.ds 11
_Splash::
	.ds 360
_SplashTiles::
	.ds 752
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
;Sprites.c:26: unsigned char Sprites[] =
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
;windowmap.c:1: unsigned char windowmap[] =
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
	ld	(hl), #0x23
;game_over_map.c:1: unsigned char gameOverMap[] =
	ld	hl, #_gameOverMap
	ld	(hl), #0x1a
	ld	hl, #(_gameOverMap + 0x0001)
	ld	(hl), #0x1c
	ld	hl, #(_gameOverMap + 0x0002)
	ld	(hl), #0x0f
	ld	hl, #(_gameOverMap + 0x0003)
	ld	(hl), #0x1d
	ld	hl, #(_gameOverMap + 0x0004)
	ld	(hl), #0x1d
	ld	hl, #(_gameOverMap + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0006)
	ld	(hl), #0x1d
	ld	hl, #(_gameOverMap + 0x0007)
	ld	(hl), #0x1e
	ld	hl, #(_gameOverMap + 0x0008)
	ld	(hl), #0x0b
	ld	hl, #(_gameOverMap + 0x0009)
	ld	(hl), #0x1c
	ld	hl, #(_gameOverMap + 0x000a)
	ld	(hl), #0x1e
	ld	hl, #(_gameOverMap + 0x000b)
	ld	(hl), #0x1a
	ld	hl, #(_gameOverMap + 0x000c)
	ld	(hl), #0x1c
	ld	hl, #(_gameOverMap + 0x000d)
	ld	(hl), #0x0f
	ld	hl, #(_gameOverMap + 0x000e)
	ld	(hl), #0x1d
	ld	hl, #(_gameOverMap + 0x000f)
	ld	(hl), #0x1d
	ld	hl, #(_gameOverMap + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_gameOverMap + 0x0011)
	ld	(hl), #0x1d
	ld	hl, #(_gameOverMap + 0x0012)
	ld	(hl), #0x1e
	ld	hl, #(_gameOverMap + 0x0013)
	ld	(hl), #0x0b
	ld	hl, #(_gameOverMap + 0x0014)
	ld	(hl), #0x1c
	ld	hl, #(_gameOverMap + 0x0015)
	ld	(hl), #0x1e
;welcomemap.c:1: unsigned char welcomemap[] =
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
;Splash.c:25: unsigned char Splash[] =
	ld	hl, #_Splash
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0014)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0015)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0016)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0017)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0018)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0019)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x001a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x001b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x001c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x001d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x001e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x001f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0029)
	ld	(hl), #0x1a
	ld	hl, #(_Splash + 0x002a)
	ld	(hl), #0x1b
	ld	hl, #(_Splash + 0x002b)
	ld	(hl), #0x1b
	ld	hl, #(_Splash + 0x002c)
	ld	(hl), #0x1c
	ld	hl, #(_Splash + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0044)
	ld	(hl), #0x01
	ld	hl, #(_Splash + 0x0045)
	ld	(hl), #0x02
	ld	hl, #(_Splash + 0x0046)
	ld	(hl), #0x03
	ld	hl, #(_Splash + 0x0047)
	ld	(hl), #0x04
	ld	hl, #(_Splash + 0x0048)
	ld	(hl), #0x05
	ld	hl, #(_Splash + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0058)
	ld	(hl), #0x07
	ld	hl, #(_Splash + 0x0059)
	ld	(hl), #0x08
	ld	hl, #(_Splash + 0x005a)
	ld	(hl), #0x09
	ld	hl, #(_Splash + 0x005b)
	ld	(hl), #0x0a
	ld	hl, #(_Splash + 0x005c)
	ld	(hl), #0x0b
	ld	hl, #(_Splash + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x006b)
	ld	(hl), #0x0c
	ld	hl, #(_Splash + 0x006c)
	ld	(hl), #0x0d
	ld	hl, #(_Splash + 0x006d)
	ld	(hl), #0x0e
	ld	hl, #(_Splash + 0x006e)
	ld	(hl), #0x0f
	ld	hl, #(_Splash + 0x006f)
	ld	(hl), #0x10
	ld	hl, #(_Splash + 0x0070)
	ld	(hl), #0x11
	ld	hl, #(_Splash + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0073)
	ld	(hl), #0x1a
	ld	hl, #(_Splash + 0x0074)
	ld	(hl), #0x1b
	ld	hl, #(_Splash + 0x0075)
	ld	(hl), #0x1b
	ld	hl, #(_Splash + 0x0076)
	ld	(hl), #0x1c
	ld	hl, #(_Splash + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x007f)
	ld	(hl), #0x12
	ld	hl, #(_Splash + 0x0080)
	ld	(hl), #0x13
	ld	hl, #(_Splash + 0x0081)
	ld	(hl), #0x14
	ld	hl, #(_Splash + 0x0082)
	ld	(hl), #0x15
	ld	hl, #(_Splash + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x009b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x009c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x009e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x009f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00bc)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00bd)
	ld	(hl), #0x17
	ld	hl, #(_Splash + 0x00be)
	ld	(hl), #0x17
	ld	hl, #(_Splash + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d1)
	ld	(hl), #0x18
	ld	hl, #(_Splash + 0x00d2)
	ld	(hl), #0x19
	ld	hl, #(_Splash + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00db)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00dc)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00df)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ea)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00eb)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00f8)
	ld	(hl), #0x1a
	ld	hl, #(_Splash + 0x00f9)
	ld	(hl), #0x1b
	ld	hl, #(_Splash + 0x00fa)
	ld	(hl), #0x1b
	ld	hl, #(_Splash + 0x00fb)
	ld	(hl), #0x1c
	ld	hl, #(_Splash + 0x00fc)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00fd)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00fe)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x00ff)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0128)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0129)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x012a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x012b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0130)
	ld	(hl), #0x1d
	ld	hl, #(_Splash + 0x0131)
	ld	(hl), #0x1e
	ld	hl, #(_Splash + 0x0132)
	ld	(hl), #0x1f
	ld	hl, #(_Splash + 0x0133)
	ld	(hl), #0x20
	ld	hl, #(_Splash + 0x0134)
	ld	(hl), #0x20
	ld	hl, #(_Splash + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0137)
	ld	(hl), #0x20
	ld	hl, #(_Splash + 0x0138)
	ld	(hl), #0x21
	ld	hl, #(_Splash + 0x0139)
	ld	(hl), #0x22
	ld	hl, #(_Splash + 0x013a)
	ld	(hl), #0x1e
	ld	hl, #(_Splash + 0x013b)
	ld	(hl), #0x21
	ld	hl, #(_Splash + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0153)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0154)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0166)
	ld	(hl), #0x00
	ld	hl, #(_Splash + 0x0167)
	ld	(hl), #0x00
;SplashTiles.c:26: unsigned char SplashTiles[] =
	ld	hl, #_SplashTiles
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0011)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0013)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0014)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0015)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0016)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0017)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0018)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0019)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x001a)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x001b)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x001c)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x001d)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x001e)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x001f)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0024)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x0025)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x0026)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x0027)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x0028)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x0029)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x002a)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x002b)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x002c)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x002d)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x002e)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x002f)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0034)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0035)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0036)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0037)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0038)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0039)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x003a)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x003b)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x003c)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x003d)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x003e)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x003f)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0044)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0045)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0046)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0047)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0048)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0049)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x004a)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x004b)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0054)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0055)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0056)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0057)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0058)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x0059)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x005a)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x005b)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x005c)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x005d)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x005e)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x005f)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0070)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0071)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0072)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0073)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0074)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0075)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0076)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0077)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0078)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0079)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x007a)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x007b)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x007c)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x007d)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x007e)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x007f)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0080)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0081)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0082)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0083)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0084)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0085)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0086)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0087)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0088)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0089)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x008a)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x008b)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x008c)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x008d)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x008e)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x008f)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0090)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0091)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0092)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0093)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0094)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0095)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0096)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0097)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0098)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0099)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x009a)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x009b)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x009c)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x009d)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x009e)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x009f)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00ac)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x00ad)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x00ae)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x00af)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x00b0)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b1)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b2)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b3)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b4)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b5)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b6)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b7)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00b8)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x00b9)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x00ba)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x00bb)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x00bc)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x00bd)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x00be)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x00bf)
	ld	(hl), #0xf0
	ld	hl, #(_SplashTiles + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x00cc)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00cd)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00ce)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00cf)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00d0)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d1)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d2)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d3)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d4)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d5)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d6)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d7)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d8)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00d9)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00da)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00db)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00dc)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00dd)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00de)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00df)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x00e0)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e1)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e2)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e3)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e4)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e5)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e6)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e7)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e8)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00e9)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00ea)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00eb)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00ec)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00ed)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00ee)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00ef)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x00f0)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x00f1)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x00f2)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x00f3)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x00f4)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00f5)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00f6)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00f7)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00f8)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00f9)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00fa)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00fb)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00fc)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00fd)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00fe)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x00ff)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0100)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0101)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0102)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0103)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0109)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x010a)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x010b)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x010c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0110)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0111)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0112)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0113)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x011c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x011d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x011e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0120)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0121)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0122)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0123)
	ld	(hl), #0x3f
	ld	hl, #(_SplashTiles + 0x0124)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0125)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0126)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0127)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0128)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x0129)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x012a)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x012b)
	ld	(hl), #0x03
	ld	hl, #(_SplashTiles + 0x012c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x012d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0130)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0131)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0132)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0133)
	ld	(hl), #0x0f
	ld	hl, #(_SplashTiles + 0x0134)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0135)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0136)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0137)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0138)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x0139)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x013a)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x013b)
	ld	(hl), #0xfc
	ld	hl, #(_SplashTiles + 0x013c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x013d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x013e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0140)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0141)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0142)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0143)
	ld	(hl), #0xc0
	ld	hl, #(_SplashTiles + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0147)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0148)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0149)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x014a)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x014b)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x014c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x014d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x014e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0150)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0151)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0152)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0153)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0154)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0155)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0156)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0157)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0158)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0159)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x015a)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x015b)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x015c)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x015d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x015e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0160)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0162)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0164)
	ld	(hl), #0xc3
	ld	hl, #(_SplashTiles + 0x0165)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0166)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0167)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0168)
	ld	(hl), #0xf7
	ld	hl, #(_SplashTiles + 0x0169)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x016a)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x016b)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x016c)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x016d)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x016e)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x016f)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x0170)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0171)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0172)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0173)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0174)
	ld	(hl), #0xc3
	ld	hl, #(_SplashTiles + 0x0175)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0176)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0177)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0178)
	ld	(hl), #0xf7
	ld	hl, #(_SplashTiles + 0x0179)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x017a)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x017b)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x017c)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x017d)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x017e)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x017f)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x0180)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0181)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0182)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0183)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0184)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0185)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0186)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0187)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0188)
	ld	(hl), #0xf8
	ld	hl, #(_SplashTiles + 0x0189)
	ld	(hl), #0x07
	ld	hl, #(_SplashTiles + 0x018a)
	ld	(hl), #0xf8
	ld	hl, #(_SplashTiles + 0x018b)
	ld	(hl), #0x07
	ld	hl, #(_SplashTiles + 0x018c)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x018d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x018e)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x018f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0190)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0191)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0192)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0193)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0194)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0195)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0196)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x0197)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0198)
	ld	(hl), #0x1f
	ld	hl, #(_SplashTiles + 0x0199)
	ld	(hl), #0xe0
	ld	hl, #(_SplashTiles + 0x019a)
	ld	(hl), #0x1f
	ld	hl, #(_SplashTiles + 0x019b)
	ld	(hl), #0xe0
	ld	hl, #(_SplashTiles + 0x019c)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x019d)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x019e)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x019f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01a0)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01a1)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01a2)
	ld	(hl), #0x80
	ld	hl, #(_SplashTiles + 0x01a3)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01a4)
	ld	(hl), #0x80
	ld	hl, #(_SplashTiles + 0x01a5)
	ld	(hl), #0x80
	ld	hl, #(_SplashTiles + 0x01a6)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01a7)
	ld	(hl), #0x80
	ld	hl, #(_SplashTiles + 0x01a8)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01a9)
	ld	(hl), #0x80
	ld	hl, #(_SplashTiles + 0x01aa)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01ab)
	ld	(hl), #0x80
	ld	hl, #(_SplashTiles + 0x01ac)
	ld	(hl), #0x80
	ld	hl, #(_SplashTiles + 0x01ad)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01ae)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01af)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01b0)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01b1)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01b2)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01b3)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01b4)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01b5)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01b6)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01b7)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01b8)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01b9)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01ba)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01bb)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01bc)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01bd)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01be)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01bf)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01c0)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01c1)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01c2)
	ld	(hl), #0x01
	ld	hl, #(_SplashTiles + 0x01c3)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01c4)
	ld	(hl), #0x01
	ld	hl, #(_SplashTiles + 0x01c5)
	ld	(hl), #0x01
	ld	hl, #(_SplashTiles + 0x01c6)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01c7)
	ld	(hl), #0x01
	ld	hl, #(_SplashTiles + 0x01c8)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01c9)
	ld	(hl), #0x01
	ld	hl, #(_SplashTiles + 0x01ca)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01cb)
	ld	(hl), #0x01
	ld	hl, #(_SplashTiles + 0x01cc)
	ld	(hl), #0x01
	ld	hl, #(_SplashTiles + 0x01cd)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01ce)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01cf)
	ld	(hl), #0xff
	ld	hl, #(_SplashTiles + 0x01d0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01d1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01d2)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01d3)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01d4)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01d5)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01d6)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01d7)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01d8)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01d9)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01da)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01db)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01dc)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01dd)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01de)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01df)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01e0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01e1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01e2)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01e3)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01e4)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01e5)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01e6)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01e7)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01e8)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01e9)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01ea)
	ld	(hl), #0x44
	ld	hl, #(_SplashTiles + 0x01eb)
	ld	(hl), #0x44
	ld	hl, #(_SplashTiles + 0x01ec)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01ed)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x01ee)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01ef)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01f0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01f1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01f2)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x01f3)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x01f4)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01f5)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01f6)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01f7)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x01f8)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01f9)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01fa)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01fb)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x01fc)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x01fd)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x01fe)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x01ff)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0200)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0201)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0202)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0203)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0204)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x0205)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x0206)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0207)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0208)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x0209)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x020a)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x020b)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x020c)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x020d)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x020e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x020f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0210)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0211)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0212)
	ld	(hl), #0xfe
	ld	hl, #(_SplashTiles + 0x0213)
	ld	(hl), #0xfe
	ld	hl, #(_SplashTiles + 0x0214)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x0215)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x0216)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x0217)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x0218)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x0219)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x021a)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x021b)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x021c)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x021d)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x021e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x021f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0220)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0221)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0222)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0223)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0224)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0225)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0226)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0227)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0228)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x0229)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x022a)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x022b)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x022c)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x022d)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x022e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x022f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0230)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0231)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0232)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0233)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0234)
	ld	(hl), #0x46
	ld	hl, #(_SplashTiles + 0x0235)
	ld	(hl), #0x46
	ld	hl, #(_SplashTiles + 0x0236)
	ld	(hl), #0x4a
	ld	hl, #(_SplashTiles + 0x0237)
	ld	(hl), #0x4a
	ld	hl, #(_SplashTiles + 0x0238)
	ld	(hl), #0x52
	ld	hl, #(_SplashTiles + 0x0239)
	ld	(hl), #0x52
	ld	hl, #(_SplashTiles + 0x023a)
	ld	(hl), #0x62
	ld	hl, #(_SplashTiles + 0x023b)
	ld	(hl), #0x62
	ld	hl, #(_SplashTiles + 0x023c)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x023d)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x023e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x023f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0240)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0241)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0242)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x0243)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x0244)
	ld	(hl), #0x28
	ld	hl, #(_SplashTiles + 0x0245)
	ld	(hl), #0x28
	ld	hl, #(_SplashTiles + 0x0246)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x0247)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x0248)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x0249)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x024a)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x024b)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x024c)
	ld	(hl), #0x3e
	ld	hl, #(_SplashTiles + 0x024d)
	ld	(hl), #0x3e
	ld	hl, #(_SplashTiles + 0x024e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x024f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0250)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0251)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0252)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0253)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0254)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0255)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0256)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x0257)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x0258)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0259)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x025a)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x025b)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x025c)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x025d)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x025e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x025f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0260)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0261)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0262)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0263)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0264)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0265)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0266)
	ld	(hl), #0x0c
	ld	hl, #(_SplashTiles + 0x0267)
	ld	(hl), #0x0c
	ld	hl, #(_SplashTiles + 0x0268)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x0269)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x026a)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x026b)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x026c)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x026d)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x026e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x026f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0270)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0271)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0272)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x0273)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x0274)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x0275)
	ld	(hl), #0x18
	ld	hl, #(_SplashTiles + 0x0276)
	ld	(hl), #0x28
	ld	hl, #(_SplashTiles + 0x0277)
	ld	(hl), #0x28
	ld	hl, #(_SplashTiles + 0x0278)
	ld	(hl), #0x48
	ld	hl, #(_SplashTiles + 0x0279)
	ld	(hl), #0x48
	ld	hl, #(_SplashTiles + 0x027a)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x027b)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x027c)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x027d)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x027e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x027f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0280)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0281)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0282)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x0283)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x0284)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x0285)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x0286)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x0287)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x0288)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x0289)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x028a)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x028b)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x028c)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x028d)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x028e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x028f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0290)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0291)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x0292)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0293)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x0294)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x0295)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x0296)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x0297)
	ld	(hl), #0x7c
	ld	hl, #(_SplashTiles + 0x0298)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x0299)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x029a)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x029b)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x029c)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x029d)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x029e)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x029f)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02a0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02a1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02a2)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x02a3)
	ld	(hl), #0x7e
	ld	hl, #(_SplashTiles + 0x02a4)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x02a5)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x02a6)
	ld	(hl), #0x04
	ld	hl, #(_SplashTiles + 0x02a7)
	ld	(hl), #0x04
	ld	hl, #(_SplashTiles + 0x02a8)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x02a9)
	ld	(hl), #0x08
	ld	hl, #(_SplashTiles + 0x02aa)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x02ab)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x02ac)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x02ad)
	ld	(hl), #0x10
	ld	hl, #(_SplashTiles + 0x02ae)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02af)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02b0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02b1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02b2)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02b3)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02b4)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02b5)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02b6)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02b7)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02b8)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02b9)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02ba)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02bb)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02bc)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02bd)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02be)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02bf)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02c0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02c1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02c2)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02c3)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02c4)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02c5)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02c6)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02c7)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02c8)
	ld	(hl), #0x3e
	ld	hl, #(_SplashTiles + 0x02c9)
	ld	(hl), #0x3e
	ld	hl, #(_SplashTiles + 0x02ca)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x02cb)
	ld	(hl), #0x02
	ld	hl, #(_SplashTiles + 0x02cc)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02cd)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02ce)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02cf)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02d0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02d1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02d2)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02d3)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02d4)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02d5)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02d6)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x02d7)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x02d8)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x02d9)
	ld	(hl), #0x40
	ld	hl, #(_SplashTiles + 0x02da)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02db)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02dc)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02dd)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02de)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02df)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02e0)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02e1)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02e2)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02e3)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02e4)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02e5)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02e6)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02e7)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02e8)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02e9)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02ea)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02eb)
	ld	(hl), #0x42
	ld	hl, #(_SplashTiles + 0x02ec)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02ed)
	ld	(hl), #0x3c
	ld	hl, #(_SplashTiles + 0x02ee)
	ld	(hl), #0x00
	ld	hl, #(_SplashTiles + 0x02ef)
	ld	(hl), #0x00
;main.c:25: BYTE jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:26: UBYTE spriteSize = 8;
	ld	hl, #_spriteSize
	ld	(hl), #0x08
;main.c:27: INT8 floor = 114;
	ld	hl, #_floor
	ld	(hl), #0x72
;main.c:30: UINT8 activePlatform = 1;
	ld	hl, #_activePlatform
	ld	(hl), #0x01
;main.c:31: UINT8 platformSpeed = 4;
	ld	hl, #_platformSpeed
	ld	(hl), #0x04
;main.c:32: UINT8 platformWaitLength = 4;
	ld	hl, #_platformWaitLength
	ld	(hl), #0x04
;main.c:33: enum PlatformDirection platformDirection = LEFT;
	ld	hl, #_platformDirection
	ld	(hl), #0x00
;main.c:34: UINT8 waitCount = 0;
	ld	hl, #_waitCount
	ld	(hl), #0x00
;main.c:35: UBYTE gameActive = 1;
	ld	hl, #_gameActive
	ld	(hl), #0x01
;main.c:36: UINT16 score = 0;
	ld	hl, #_score
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:286: UINT8 fontNumBase = 0x01;
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
;main.c:38: void performantDelay(UINT8 numloops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:41: for(i=0; i<numloops;i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:42: wait_vbl_done();
	call	_wait_vbl_done
;main.c:41: for(i=0; i<numloops;i++){
	inc	c
;main.c:44: }
	jr	00103$
_gravity:
	.db #0xfe	; -2
_BASE_JUMP_SPEED:
	.db #0x0f	;  15
;main.c:46: void playSound(enum Sound sound){
;	---------------------------------
; Function playSound
; ---------------------------------
_playSound::
;main.c:47: switch(sound){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ret
;main.c:48: case JUMP:
00101$:
;main.c:49: NR10_REG = 0x16; 
	ld	a, #0x16
	ldh	(_NR10_REG+0),a
;main.c:50: NR11_REG = 0x40;
	ld	a, #0x40
	ldh	(_NR11_REG+0),a
;main.c:51: NR12_REG = 0x73;  
	ld	a, #0x73
	ldh	(_NR12_REG+0),a
;main.c:52: NR13_REG = 0x00;   
	ld	a, #0x00
	ldh	(_NR13_REG+0),a
;main.c:53: NR14_REG = 0xC3;	        
	ld	a, #0xc3
	ldh	(_NR14_REG+0),a
;main.c:54: break;
	ret
;main.c:55: case GAME_OVER:
00102$:
;main.c:56: NR10_REG = 0x79;
	ld	a, #0x79
	ldh	(_NR10_REG+0),a
;main.c:57: NR11_REG = 0xC2;
	ld	a, #0xc2
	ldh	(_NR11_REG+0),a
;main.c:58: NR12_REG = 0x54;
	ld	a, #0x54
	ldh	(_NR12_REG+0),a
;main.c:59: NR13_REG = 0x73;
	ld	a, #0x73
	ldh	(_NR13_REG+0),a
;main.c:60: NR14_REG = 0x86;
	ld	a, #0x86
	ldh	(_NR14_REG+0),a
;main.c:62: }
;main.c:63: }
	ret
;main.c:65: void movePlatform(struct MetaSprite* platform, UINT8 x, UINT8 y)
;	---------------------------------
; Function movePlatform
; ---------------------------------
_movePlatform::
	add	sp, #-3
;main.c:67: move_sprite(platform->spriteIds[0], x, y);
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
;main.c:68: move_sprite(platform->spriteIds[1], x + spriteSize, y);
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
;main.c:69: move_sprite(platform->spriteIds[2], x + (spriteSize * 2), y);
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
;main.c:69: move_sprite(platform->spriteIds[2], x + (spriteSize * 2), y);
;main.c:70: }
	add	sp, #3
	ret
;main.c:72: void movePlayer(struct MetaSprite* player, UINT8 x, UINT8 y)
;	---------------------------------
; Function movePlayer
; ---------------------------------
_movePlayer::
	add	sp, #-3
;main.c:74: move_sprite(player->spriteIds[0], x, y);
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
;main.c:75: move_sprite(player->spriteIds[1], x + spriteSize, y);
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
;main.c:76: move_sprite(player->spriteIds[2], x, y + spriteSize);
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
;main.c:77: move_sprite(player->spriteIds[3], x + spriteSize, y + spriteSize);
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
;main.c:77: move_sprite(player->spriteIds[3], x + spriteSize, y + spriteSize);
;main.c:78: }
	add	sp, #3
	ret
;main.c:80: void initPlatform(UINT8 id, UINT8 x, UINT8 y)
;	---------------------------------
; Function initPlatform
; ---------------------------------
_initPlatform::
	dec	sp
;main.c:82: platforms[id].x = x; //76
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
;main.c:83: platforms[id].y = y; //130
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;main.c:84: platforms[id].width = 24;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x18
;main.c:85: platforms[id].height = 8;
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x08
;main.c:86: platforms[id].yAtJump = y;
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(de), a
;main.c:87: set_sprite_tile(5 + (id * 3),0);
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
;main.c:88: platforms[id].spriteIds[0] = 5 + (id * 3);
	ld	a, e
	ld	(bc), a
;main.c:89: set_sprite_tile(6 + (id * 3),1);
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
;main.c:90: platforms[id].spriteIds[1] = 6 + (id * 3);
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), e
;main.c:91: set_sprite_tile(7 + (id * 3),2);
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
;main.c:92: platforms[id].spriteIds[2] = 7 + (id * 3);
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), e
;main.c:94: movePlatform(&platforms[id], platforms[id].x, platforms[id].y);
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
;main.c:95: }
	inc	sp
	ret
;main.c:97: void initPlayer(UINT8 x)
;	---------------------------------
; Function initPlayer
; ---------------------------------
_initPlayer::
;main.c:99: player.x = x;
	ld	bc, #_player+0
	ld	de, #(_player + 0x0004)
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(de), a
;main.c:100: player.y = 84;
	ld	hl, #(_player + 0x0005)
	ld	(hl), #0x54
;main.c:101: player.width = 16;
	ld	hl, #(_player + 0x0006)
	ld	(hl), #0x10
;main.c:102: player.height = 16;
	ld	hl, #(_player + 0x0007)
	ld	(hl), #0x10
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0006)
	ld	(hl), #0x03
;main.c:104: player.spriteIds[0] = 1;
	ld	a, #0x01
	ld	(bc), a
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000a)
	ld	(hl), #0x04
;main.c:106: player.spriteIds[1] = 2;
	ld	hl, #(_player + 0x0001)
	ld	(hl), #0x02
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x000e)
	ld	(hl), #0x05
;main.c:108: player.spriteIds[2] = 3;
	ld	hl, #(_player + 0x0002)
	ld	(hl), #0x03
;P:/_lib/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0012)
	ld	(hl), #0x06
;main.c:110: player.spriteIds[3] = 4;
	ld	hl, #(_player + 0x0003)
	ld	(hl), #0x04
;main.c:112: movePlayer(&player, player.x, player.y);
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
;main.c:113: }
	ret
;main.c:115: INT8 wouldHitSurface(struct MetaSprite* platform)
;	---------------------------------
; Function wouldHitSurface
; ---------------------------------
_wouldHitSurface::
;main.c:117: if(platform->y <= platform->yAtJump){
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
;main.c:118: return platform->yAtJump;
	ret	NC
;main.c:120: return -1;
	ld	e, #0xff
;main.c:121: }
	ret
;main.c:123: BOOLEAN isCollision(){
;	---------------------------------
; Function isCollision
; ---------------------------------
_isCollision::
;main.c:124: if(platforms[activePlatform].y < 100){
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
;main.c:127: return platforms[activePlatform].x < 96;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;main.c:125: switch(platformDirection){
	ld	a, (#_platformDirection)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_platformDirection)
	dec	a
	jr	Z, 00102$
	jr	00103$
;main.c:126: case LEFT:
00101$:
;main.c:127: return platforms[activePlatform].x < 96;
	ld	a, (bc)
	sub	a, #0x60
	ld	a, #0x00
	rla
	ld	e, a
	ret
;main.c:128: case RIGHT:
00102$:
;main.c:129: return platforms[activePlatform].x > 56 && platforms[activePlatform].x < 240;
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
;main.c:130: default: 
00103$:
;main.c:131: return 0;
	ld	e, #0x00
	ret
;main.c:132: }
00106$:
;main.c:134: return 0;
	ld	e, #0x00
;main.c:135: }
	ret
;main.c:137: BOOLEAN platformIsUnderPlayer(){
;	---------------------------------
; Function platformIsUnderPlayer
; ---------------------------------
_platformIsUnderPlayer::
;main.c:138: if(platforms[activePlatform].y <= 102){
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
;main.c:141: return platforms[activePlatform].x < 90;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
;main.c:139: switch(platformDirection){
	ld	a, (#_platformDirection)
	or	a, a
	jr	Z, 00101$
	ld	a, (#_platformDirection)
	dec	a
	jr	Z, 00102$
	jr	00103$
;main.c:140: case LEFT:
00101$:
;main.c:141: return platforms[activePlatform].x < 90;
	ld	a, (bc)
	sub	a, #0x5a
	ld	a, #0x00
	rla
	ld	e, a
	ret
;main.c:142: case RIGHT:
00102$:
;main.c:143: return platforms[activePlatform].x > 62 && platforms[activePlatform].x < 240;
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
;main.c:144: default: 
00103$:
;main.c:145: return 0;
	ld	e, #0x00
	ret
;main.c:146: }
00106$:
;main.c:148: return 0;
	ld	e, #0x00
;main.c:149: }
	ret
;main.c:151: void jump()
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
	add	sp, #-4
;main.c:155: if(jumping == 0) {
	ld	a, (#_jumping)
	or	a, a
	jr	NZ, 00103$
;main.c:156: playSound(JUMP);    
	xor	a, a
	push	af
	inc	sp
	call	_playSound
	inc	sp
;main.c:157: jumping = 1;
	ld	hl, #_jumping
	ld	(hl), #0x01
;main.c:158: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
	ld	c, #0x00
00113$:
	ld	a, c
	sub	a, #0x04
	jr	NC, 00101$
;main.c:160: platforms[i].yAtJump = platforms[i].y;
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
;main.c:158: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
	inc	c
	jr	00113$
00101$:
;main.c:162: currentSpeedY = BASE_JUMP_SPEED;
	ld	a, (#_BASE_JUMP_SPEED)
	ld	(#_currentSpeedY),a
00103$:
;main.c:164: currentSpeedY = currentSpeedY + gravity;
	ld	hl, #_gravity
	ld	e, (hl)
	ld	hl, #_currentSpeedY
	ld	a, (hl)
	add	a, e
	ld	(hl), a
;main.c:165: if(currentSpeedY < -(BASE_JUMP_SPEED - gravity)) currentSpeedY = 0;
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
;main.c:167: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
00127$:
	xor	a, a
	ldhl	sp,	#3
	ld	(hl), a
00116$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00118$
;main.c:169: if(platformIsUnderPlayer()){
	call	_platformIsUnderPlayer
	push	hl
	ldhl	sp,	#4
	ld	(hl), e
	pop	hl
;main.c:170: platforms[i].yAtJump = 100;
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
;main.c:169: if(platformIsUnderPlayer()){
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00107$
;main.c:170: platforms[i].yAtJump = 100;
	ld	hl, #_platforms
	add	hl, bc
	ld	de, #0x0008
	add	hl, de
	ld	(hl), #0x64
00107$:
;main.c:172: platforms[i].y += currentSpeedY;    
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
;main.c:173: possibleSurfaceY = wouldHitSurface(&platforms[i]);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_wouldHitSurface
	add	sp, #2
	pop	bc
	ldhl	sp,	#0
	ld	(hl), e
;main.c:174: if(currentSpeedY == 0 || possibleSurfaceY > -1){
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
;main.c:176: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:177: platforms[i].y = platforms[i].yAtJump;
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
;main.c:179: movePlatform(&platforms[i], platforms[i].x, platforms[i].y);
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
;main.c:167: for (UINT8 i = 0; i < PLATFORM_COUNT; i++)
	ldhl	sp,	#3
	inc	(hl)
	jp	00116$
00118$:
;main.c:181: }
	add	sp, #4
	ret
;main.c:183: void updatePlayer()
;	---------------------------------
; Function updatePlayer
; ---------------------------------
_updatePlayer::
;main.c:185: movePlayer(&player, player.x, player.y);
	ld	hl, #_player + 5
	ld	b, (hl)
	ld	hl, #_player + 4
	ld	c, (hl)
	push	bc
	ld	hl, #_player
	push	hl
	call	_movePlayer
	add	sp, #4
;main.c:186: }
	ret
;main.c:188: UINT8 getRand(UINT8 min, UINT8 max){
;	---------------------------------
; Function getRand
; ---------------------------------
_getRand::
	dec	sp
;main.c:189: return (((UINT8)rand()) % ((UINT8)max + (UINT8) 1 - min)) + min;
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
;main.c:190: }
	inc	sp
	ret
;main.c:192: void setScore(BOOLEAN increment){
;	---------------------------------
; Function setScore
; ---------------------------------
_setScore::
	add	sp, #-3
;main.c:193: if(increment) score++;
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
;main.c:194: for (UINT8 i = 0; i < 4; i++)
00122$:
	ld	c, #0x00
00116$:
;main.c:196: windowmap[7+i] = (unsigned char) (0x23);
	ld	a,c
	cp	a,#0x04
	jr	NC, 00103$
	add	a, #0x07
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #_windowmap
	add	hl, de
	ld	(hl), #0x23
;main.c:194: for (UINT8 i = 0; i < 4; i++)
	inc	c
	jr	00116$
00103$:
;main.c:200: windowmap[10] = (unsigned char) (0x23 + score);
;main.c:199: if(score < 10){  
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0x0a
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00113$
;main.c:200: windowmap[10] = (unsigned char) (0x23 + score);
	ld	a, (#_score)
	add	a, #0x23
	ld	(#(_windowmap + 0x000a)),a
	jp	00118$
00113$:
;main.c:204: UINT8 ones = score % 10;
	ld	hl, #0x000a
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
;main.c:205: windowmap[9] = (unsigned char) (0x23 + tens);
	call	__moduint
	add	sp, #4
	ld	c, e
;main.c:204: UINT8 ones = score % 10;
;main.c:202: else if(score < 100){
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0x64
	inc	hl
	ld	a, (hl)
	sbc	a, #0x00
	jr	NC, 00110$
;main.c:203: UINT8 tens = score / 10;
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
;main.c:204: UINT8 ones = score % 10;
;main.c:205: windowmap[9] = (unsigned char) (0x23 + tens);
	add	a, #0x23
	ld	(#(_windowmap + 0x0009)),a
;main.c:206: windowmap[10] = (unsigned char) (0x23 + ones);
	ld	a, c
	add	a, #0x23
	ld	(#(_windowmap + 0x000a)),a
	jp	00118$
00110$:
;main.c:210: UINT8 tens = (score % 100) / 10;
	push	bc
	ld	hl, #0x0064
	push	hl
	ld	hl, #_score
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
;main.c:212: windowmap[8] = (unsigned char) (0x23 + huns);
	call	__moduint
	add	sp, #4
	ld	hl, #0x000a
	push	hl
	push	de
	call	__divuint
	add	sp, #4
	pop	bc
	ld	b, e
;main.c:208: else if(score < 1000){
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0xe8
	inc	hl
	ld	a, (hl)
	sbc	a, #0x03
	jr	NC, 00107$
;main.c:209: UINT8 huns = score / 100;
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
;main.c:210: UINT8 tens = (score % 100) / 10;
;main.c:211: UINT8 ones = score % 10;
;main.c:212: windowmap[8] = (unsigned char) (0x23 + huns);
	add	a, #0x23
	ld	(#(_windowmap + 0x0008)),a
;main.c:213: windowmap[9] = (unsigned char) (0x23 + tens);
	ld	a, b
	add	a, #0x23
	ld	(#(_windowmap + 0x0009)),a
;main.c:214: windowmap[10] = (unsigned char) (0x23 + ones);
	ld	a, c
	add	a, #0x23
	ld	(#(_windowmap + 0x000a)),a
	jr	00118$
00107$:
;main.c:216: else if(score < 10000){
	ld	hl, #_score
	ld	a, (hl)
	sub	a, #0x10
	inc	hl
	ld	a, (hl)
	sbc	a, #0x27
	jr	NC, 00118$
;main.c:217: UINT8 thous = score / 1000;
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
;main.c:218: UINT8 huns = (score % 1000) / 100;
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
;main.c:219: UINT8 tens = (score % 100) / 10;
	ld	a, e
	ld	(hl+), a
;main.c:220: UINT8 ones = score % 10;
;main.c:221: windowmap[7] = (unsigned char) (0x23 + thous);
	ld	a, b
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	add	a, #0x23
	ld	(#(_windowmap + 0x0007)),a
;main.c:222: windowmap[8] = (unsigned char) (0x23 + huns);
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x23
	ld	(#(_windowmap + 0x0008)),a
;main.c:223: windowmap[9] = (unsigned char) (0x23 + tens);
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x23
	ld	(#(_windowmap + 0x0009)),a
;main.c:224: windowmap[10] = (unsigned char) (0x23 + ones);
	ld	a, c
	add	a, #0x23
	ld	(#(_windowmap + 0x000a)),a
00118$:
;main.c:226: }
	add	sp, #3
	ret
;main.c:228: void updateScore(){
;	---------------------------------
; Function updateScore
; ---------------------------------
_updateScore::
;main.c:229: set_win_tiles(0,0,11,1, windowmap);
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
;main.c:230: move_win(7,136);
;main.c:231: }
	ret
;main.c:233: void changeActivePlatform(){
;	---------------------------------
; Function changeActivePlatform
; ---------------------------------
_changeActivePlatform::
;main.c:234: activePlatform = activePlatform + 1 > 3 ? 0 : activePlatform + 1;
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
;main.c:235: }
	ret
;main.c:237: void randomiseValues(BOOLEAN incrementScore){
;	---------------------------------
; Function randomiseValues
; ---------------------------------
_randomiseValues::
;main.c:238: if(platforms[activePlatform].y == 100){
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
;main.c:239: waitCount = 0;
	ld	hl, #_waitCount
	ld	(hl), #0x00
;main.c:240: platformWaitLength = getRand(2,15); 
	ld	de, #0x0f02
	push	de
	call	_getRand
	add	sp, #2
	ld	hl, #_platformWaitLength
	ld	(hl), e
;main.c:241: platformSpeed = getRand(8,10);
	ld	de, #0x0a08
	push	de
	call	_getRand
	add	sp, #2
	ld	hl, #_platformSpeed
	ld	(hl), e
;main.c:242: platformDirection = getRand(0,1);
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
;main.c:243: initPlatform(activePlatform, 76, 100);
	ld	de, #0x644c
	push	de
	ld	a, (#_activePlatform)
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:245: changeActivePlatform();
	call	_changeActivePlatform
;main.c:247: UINT8 x = platformDirection ? 0xF0 : 170; 
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
;main.c:248: initPlatform(activePlatform, x, 60);
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
;main.c:249: setScore(incrementScore);
	ldhl	sp,	#2
	ld	a, (hl)
	push	af
	inc	sp
	call	_setScore
	inc	sp
;main.c:251: }
	ret
;main.c:253: void loadFonts(){
;	---------------------------------
; Function loadFonts
; ---------------------------------
_loadFonts::
;main.c:256: font_init();
	call	_font_init
;main.c:257: min_font = font_load(font_min);
	ld	hl, #_font_min
	push	hl
	call	_font_load
	add	sp, #2
;main.c:258: font_set(min_font);
	push	de
	call	_font_set
	add	sp, #2
;main.c:259: }
	ret
;main.c:261: void showStartScreen(){
;	---------------------------------
; Function showStartScreen
; ---------------------------------
_showStartScreen::
;main.c:262: set_win_tiles(0,0,20,18, Splash);
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
;main.c:264: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;main.c:265: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:266: }
	ret
;main.c:268: void showGameOverScreen(){
;	---------------------------------
; Function showGameOverScreen
; ---------------------------------
_showGameOverScreen::
;main.c:269: initPlatform(0, 170, 100);
	ld	de, #0x64aa
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:270: initPlatform(1, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:271: initPlatform(2, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:272: initPlatform(3, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:273: initPlayer(170);
	ld	a, #0xaa
	push	af
	inc	sp
	call	_initPlayer
	inc	sp
;main.c:274: set_win_tiles(0,0,20,18, Splash);
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
;main.c:276: SHOW_WIN;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x20
	ldh	(_LCDC_REG+0),a
;main.c:277: waitpad(J_START);
	ld	a, #0x80
	push	af
	inc	sp
	call	_waitpad
	inc	sp
;main.c:278: }
	ret
;main.c:280: void seedRandom(){
;	---------------------------------
; Function seedRandom
; ---------------------------------
_seedRandom::
;main.c:281: uint16_t seed = LY_REG;
	ldh	a, (_LY_REG+0)
	ld	c, a
	ld	b, #0x00
;main.c:282: seed |= (uint16_t)DIV_REG << 8;
	ldh	a, (_DIV_REG+0)
	ld	e, a
	ld	a, #0x00
	or	a, c
	ld	c, a
	ld	a, e
	or	a, b
	ld	b, a
;main.c:283: initrand(seed);
	push	bc
	call	_initrand
	add	sp, #2
;main.c:284: }
	ret
;main.c:288: BOOLEAN activePlatformIsWaiting(){
;	---------------------------------
; Function activePlatformIsWaiting
; ---------------------------------
_activePlatformIsWaiting::
;main.c:289: if(waitCount < platformWaitLength){
	ld	a, (#_waitCount)
	ld	hl, #_platformWaitLength
	sub	a, (hl)
	jr	NC, 00102$
;main.c:290: waitCount++;
	ld	hl, #_waitCount
	inc	(hl)
;main.c:291: return 1;
	ld	e, #0x01
	ret
00102$:
;main.c:293: return 0;
	ld	e, #0x00
;main.c:294: }
	ret
;main.c:296: void moveActivePlatform(){
;	---------------------------------
; Function moveActivePlatform
; ---------------------------------
_moveActivePlatform::
	add	sp, #-9
;main.c:297: if(activePlatformIsWaiting()) return;
	call	_activePlatformIsWaiting
	ld	a, e
	or	a, a
	jp	NZ,00114$
;main.c:301: if(platforms[activePlatform].x - platformSpeed > 76){
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
;main.c:299: switch(platformDirection){
	ld	a, (#_platformDirection)
	or	a, a
	jr	Z, 00103$
	ld	a, (#_platformDirection)
	dec	a
	jp	Z,00111$
	jp	00114$
;main.c:300: case LEFT:
00103$:
;main.c:301: if(platforms[activePlatform].x - platformSpeed > 76){
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
;main.c:302: platforms[activePlatform].x -= platformSpeed;
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
;main.c:303: movePlatform(&platforms[activePlatform], platforms[activePlatform].x, platforms[activePlatform].y);
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
;main.c:306: movePlatform(&platforms[activePlatform], 76, platforms[activePlatform].y);
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	e,#0x4c
	push	de
	push	bc
	call	_movePlatform
	add	sp, #4
;main.c:307: randomiseValues(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_randomiseValues
	inc	sp
;main.c:309: break;
	jp	00114$
;main.c:311: if((platforms[activePlatform].x <= 255 && platforms[activePlatform].x >= 224) || platforms[activePlatform].x + platformSpeed < 76){
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
;main.c:312: platforms[activePlatform].x += platformSpeed;
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
;main.c:313: movePlatform(&platforms[activePlatform], platforms[activePlatform].x, platforms[activePlatform].y);
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
;main.c:316: movePlatform(&platforms[activePlatform], 76, platforms[activePlatform].y);
	ld	hl, #0x0005
	add	hl, bc
	ld	d, (hl)
	ld	e,#0x4c
	push	de
	push	bc
	call	_movePlatform
	add	sp, #4
;main.c:317: randomiseValues(TRUE);
	ld	a, #0x01
	push	af
	inc	sp
	call	_randomiseValues
	inc	sp
;main.c:320: }
00114$:
;main.c:321: }
	add	sp, #9
	ret
;main.c:323: void loop(){
;	---------------------------------
; Function loop
; ---------------------------------
_loop::
;main.c:324: while (1)
00109$:
;main.c:327: if(isCollision()) return;
	call	_isCollision
	ld	a, e
	or	a, a
	ret	NZ
;main.c:330: if((joypad() & J_A) || jumping == 1){
	call	_joypad
	bit	4, e
	jr	NZ, 00103$
	ld	a, (#_jumping)
	dec	a
	jr	NZ, 00104$
00103$:
;main.c:331: jump();
	call	_jump
00104$:
;main.c:335: if(isCollision()) return;
	call	_isCollision
	ld	a, e
	or	a, a
	ret	NZ
;main.c:338: moveActivePlatform();    
	call	_moveActivePlatform
;main.c:340: updateScore();
	call	_updateScore
;main.c:342: performantDelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;main.c:343: gbt_update();
	call	_gbt_update
;main.c:345: }
	jr	00109$
;main.c:347: void startBGM(){
;	---------------------------------
; Function startBGM
; ---------------------------------
_startBGM::
;main.c:348: disable_interrupts();
	call	_disable_interrupts
;main.c:349: gbt_play(song_Data, 2, 2);
	ld	de, #0x0202
	push	de
	ld	hl, #_song_Data
	push	hl
	call	_gbt_play
	add	sp, #4
;main.c:350: gbt_loop(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_gbt_loop
	inc	sp
;main.c:352: set_interrupts(VBL_IFLAG);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;main.c:353: enable_interrupts();
;main.c:354: }
	jp  _enable_interrupts
;main.c:356: void playGameOverSFX(){
;	---------------------------------
; Function playGameOverSFX
; ---------------------------------
_playGameOverSFX::
;main.c:357: playSound(GAME_OVER);
	ld	a, #0x01
	push	af
	inc	sp
	call	_playSound
	inc	sp
;main.c:358: gbt_stop();
;main.c:359: }
	jp  _gbt_stop
;main.c:361: void init()
;	---------------------------------
; Function init
; ---------------------------------
_init::
;main.c:364: currentSpeedY = 0;
	ld	hl, #_currentSpeedY
	ld	(hl), #0x00
;main.c:365: jumping = 0;
	ld	hl, #_jumping
	ld	(hl), #0x00
;main.c:366: spriteSize = 8;
	ld	hl, #_spriteSize
	ld	(hl), #0x08
;main.c:367: floor = 114;
	ld	hl, #_floor
	ld	(hl), #0x72
;main.c:368: platformSpeed = 6;
	ld	hl, #_platformSpeed
	ld	(hl), #0x06
;main.c:369: platformWaitLength = 4;
	ld	hl, #_platformWaitLength
	ld	(hl), #0x04
;main.c:370: waitCount = 0;
	ld	hl, #_waitCount
	ld	(hl), #0x00
;main.c:371: gameActive = 1;
	ld	hl, #_gameActive
	ld	(hl), #0x01
;main.c:372: score = 0;
	ld	hl, #_score
	ld	a, #0x00
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:373: setScore(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_setScore
	inc	sp
;main.c:376: changeActivePlatform();
	call	_changeActivePlatform
;main.c:377: randomiseValues(FALSE);
	xor	a, a
	push	af
	inc	sp
	call	_randomiseValues
	inc	sp
;main.c:379: updateScore();
	call	_updateScore
;main.c:382: set_win_tiles(0,0,11,1, windowmap);
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
;main.c:386: set_sprite_data(0,7,Sprites);
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
;main.c:389: initPlatform(0, 76, 100);
	ld	de, #0x644c
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:390: initPlatform(1, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x01
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:391: initPlatform(2, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x02
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:392: initPlatform(3, 170, 60);
	ld	de, #0x3caa
	push	de
	ld	a, #0x03
	push	af
	inc	sp
	call	_initPlatform
	add	sp, #3
;main.c:393: initPlayer(80);
	ld	a, #0x50
	push	af
	inc	sp
	call	_initPlayer
	inc	sp
;main.c:396: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:397: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:398: }
	ret
;main.c:400: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:403: NR52_REG = 0x80; // is 1000 0000 in binary and turns on sound
	ld	a, #0x80
	ldh	(_NR52_REG+0),a
;main.c:404: NR50_REG = 0x77; // sets the volume for both left and right channel just set to max 0x77
	ld	a, #0x77
	ldh	(_NR50_REG+0),a
;main.c:405: NR51_REG = 0xFF; // is 1111 1111 in binary, select which chanels we want to use in this case all of them. One bit for the L one bit for the R of all four channels
	ld	a, #0xff
	ldh	(_NR51_REG+0),a
;main.c:408: loadFonts();
	call	_loadFonts
;main.c:409: set_bkg_data(0,47, SplashTiles);
	ld	hl, #_SplashTiles
	push	hl
	ld	a, #0x2f
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:410: showStartScreen();
	call	_showStartScreen
;main.c:411: seedRandom();
	call	_seedRandom
;main.c:413: while(1){
00102$:
;main.c:414: startBGM();
	call	_startBGM
;main.c:415: init();
	call	_init
;main.c:416: loop();
	call	_loop
;main.c:417: playGameOverSFX();
	call	_playGameOverSFX
;main.c:418: showGameOverScreen();
	call	_showGameOverScreen
;main.c:420: }
	jr	00102$
	.area _CODE
	.area _CABS (ABS)
