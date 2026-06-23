ENTRY(_start)

MEMORY
{
  RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 4M
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
  .preinit_array : { *(.preinit_array*) } > RAM
  .init_array : { *(.init_array*) } > RAM
  .fini_array : { *(.fini_array*) } > RAM

  . = ALIGN(4);
  .data : { *(.data*) } > RAM

  . = ALIGN(4);
  _sbss = .;
  .bss : { *(.bss*) } > RAM
  _ebss = .;
  _end = .;

  _sstack = ORIGIN(RAM) + LENGTH(RAM) - 0x2000;
  _fb_ptr = ORIGIN(RAM) + LENGTH(RAM) - 4;
}