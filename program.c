#include <stdio.h>
#include "console.h"

int main(void) {
    console_init();
    printf("Hello RV32I!\n");
    printf("Console %dx%d\n", CONSOLE_COLS, CONSOLE_ROWS);
    for (int i = 0; i < CONSOLE_ROWS * 2; i++)
        printf("Line %d\n", i + 1);
    printf("Scroll test done.\n");
    return 0;
}
