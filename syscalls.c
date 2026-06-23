#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include "console.h"

extern char _end;
static char *heap_end = &_end;

static int console_put(char c, FILE *f) {
    (void)f;
    console_putchar(c);
    return (unsigned char)c;
}

static int console_get(FILE *f) {
    (void)f;
    return -1;
}

static int console_flush(FILE *f) {
    (void)f;
    return 0;
}

static FILE __stdio_stdout = {
    .put = console_put,
    .get = console_get,
    .flush = console_flush,
    .flags = __SWR,
};

FILE *const stdout = &__stdio_stdout;
FILE *const stdin = &__stdio_stdout;
FILE *const stderr = &__stdio_stdout;

void *_sbrk(ptrdiff_t incr) {
    char *prev = heap_end;
    heap_end += incr;
    return (void *)prev;
}

int _write(int fd, const void *buf, size_t n) {
    if (fd == 1 || fd == 2) {
        console_write(buf, n);
        return n;
    }
    return -1;
}

int _read(int fd, void *buf, size_t n) {
    return -1;
}

void _exit(int status) {
    __asm__ volatile("ebreak");
    for (;;);
}

int _close(int fd) {
    return -1;
}

int _fstat(int fd, struct stat *st) {
    st->st_mode = S_IFCHR;
    return 0;
}

int _isatty(int fd) {
    return 1;
}

off_t _lseek(int fd, off_t offset, int whence) {
    return 0;
}

int _getpid(void) {
    return 1;
}

int _kill(int pid, int sig) {
    return -1;
}
