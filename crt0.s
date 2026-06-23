.section .text
.global _start

_start:
    la sp, _sstack
    call __libc_init_array
    call main
    ebreak
