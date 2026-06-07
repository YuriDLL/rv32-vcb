# RV32I project in Virtual Circuit Board game

Project make for [Virtual Circuit Board game](https://store.steampowered.com/app/1885690/Virtual_Circuit_Board/) .

For compile use riscv64-unknown-elf-gcc version 13.2.0 (13.2.0-11ubuntu1+12)

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
| + | lb | word-aligned only
| + | lh | word-aligned only
| + | lw | word-aligned only
| + | lbu | word-aligned only
| + | lhu | word-aligned only
| + | sb | word-aligned only
| + | sh | word-aligned only
| + | sw | word-aligned only
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
