MEMORY
{
  RAM : ORIGIN = 0x00000000, LENGTH = 64K
}

SECTIONS
{
  .text : {
    . = 0x4;
    *(.text*)
  } > RAM

  .data : { *(.data*) }
  .bss  : { *(.bss*) }
}