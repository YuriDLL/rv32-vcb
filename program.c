#include <stdio.h>
#include "console.h"

const volatile uint32_t *random_val = (const volatile uint32_t *) 0x400000;

int main(void) {
    console_init();
    printf("Hello RV32I!\n");
    for (int i = 0; i < 3; i++)
    {
        printf("random val %d = %x\n", i, *random_val);
    }
    return 0;
}
