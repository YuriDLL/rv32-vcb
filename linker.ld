MEMORY
{
  RAM : ORIGIN = 0x00000000, LENGTH = 4M
}

SECTIONS
{
  .text : {
    . = 0x4;
    *(.text*)
  } > RAM

  . = ALIGN(4);
  .rodata : { *(.rodata*) } > RAM

  . = ALIGN(4);
  .data : { *(.data*) } > RAM

  . = ALIGN(4);
  _sbss = .;
  .bss : { *(.bss*) } > RAM
  _ebss = .;

  _sstack = ORIGIN(RAM) + LENGTH(RAM);
}