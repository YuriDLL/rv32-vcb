#ifndef CONSOLE_H
#define CONSOLE_H

#define CONSOLE_COLS 32
#define CONSOLE_ROWS 32

void console_init(void);
void console_clear(void);
void console_putchar(char c);
void console_write(const void *buf, int len);

#endif
