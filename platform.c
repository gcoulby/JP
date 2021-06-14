#include <gb/gb.h>

struct MetaSprite {
    UBYTE spriteIds[4];
    UINT8 x;
    UINT8 y;
    UINT8 width;
    UINT8 height;
    UINT8 yAtJump;
};