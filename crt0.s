.section .text
.global _start

_start:
    la sp, _sstack

    la t0, _sbss
    la t1, _ebss
    bgeu t0, t1, bss_done
bss_loop:
    sw zero, 0(t0)
    addi t0, t0, 4
    bltu t0, t1, bss_loop
bss_done:
    jal ra, main

    li a0, 0
    ebreak
