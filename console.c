#include "console.h"
#include "font8x8.h"
#include <string.h>

extern unsigned int _fb_ptr;
static volatile unsigned char fb[CONSOLE_COLS * CONSOLE_ROWS * 8];
static int cx, cy;

static void scroll(void) {
    memmove((void *)fb, (void *)(fb + CONSOLE_COLS * 8),
            (CONSOLE_ROWS - 1) * CONSOLE_COLS * 8);
    memset((void *)(fb + (CONSOLE_ROWS - 1) * CONSOLE_COLS * 8), 0,
           CONSOLE_COLS * 8);
}

void console_init(void) {
    *(volatile unsigned int *)&_fb_ptr = (unsigned int)fb >> 2;
}

void console_clear(void) {
    memset((void *)fb, 0, CONSOLE_COLS * CONSOLE_ROWS * 8);
    cx = 0;
    cy = 0;
}

void console_putchar(char c) {
    if (c == '\n') {
        cx = 0;
        cy++;
    } else if (c == '\r') {
        cx = 0;
    } else {
        const unsigned char *glyph = &font8x8[(unsigned char)c * 8];
        int base = cy * 8 * CONSOLE_COLS + cx;
        for (int y = 0; y < 8; y++) {
            int off = base + y * CONSOLE_COLS;
            fb[off ^ 3] = glyph[y];
        }
        cx++;
    }
    if (cx >= CONSOLE_COLS) {
        cx = 0;
        cy++;
    }
    while (cy >= CONSOLE_ROWS) {
        scroll();
        cy--;
    }
}

void console_write(const void *buf, int len) {
    const char *s = (const char *)buf;
    for (int i = 0; i < len; i++)
        console_putchar(s[i]);
}
