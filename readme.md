# RV32I project in Virtual Circuit Board game

Project make for [Virtual Circuit Board game](https://store.steampowered.com/app/1885690/Virtual_Circuit_Board/) .

## Toolchain setup

```bash
# Compiler and binutils
sudo apt install gcc-riscv64-unknown-elf binutils-riscv64-unknown-elf

# C standard library (picolibc — lightweight newlib alternative)
sudo apt install picolibc-riscv64-unknown-elf
```

Requires `riscv64-unknown-elf-gcc` (tested with 13.2.0)

For download in game :

* Open VMem Editor
* Edit VMem externally
* Embed and edit locally
* Confirm

supported instructions:

supported | instruction | note
|-|-| -
| + | lui
| + | auipc
| + | jal
| + | jalr
| + | beq
| + | bne
| + | blt
| + | bge
| + | bltu
| + | bgeu
| + | lb
| + | lh
| + | lw
| + | lbu
| + | lhu
| + | sb
| + | sh
| + | sw
| + | addi
| + | slti
| + | sltiu
| + | xori
| + | ori
| + | andi
| + | slli
| + | srli
| + | srai
| + | add
| + | sub
| + | sll
| + | slt
| + | sltu
| + | xor
| + | srl
| + | sra
| + | or
| + | and
| + | sbreak

possible bug in pc 2 adder 

## C compiler notes

For C code, use `-mno-unaligned-access` flag to prevent the compiler from generating unaligned load/store instructions (this CPU only supports word-aligned memory accesses). 
