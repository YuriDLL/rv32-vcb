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
| - | jalr
| + | beq
| + | bne
| - | blt
| - | bge
| - | bltu
| - | bgeu
| + | lb
| + | lh
| + | lw
| + | lbu
| + | lhu
| - | sb
| - | sh
| - | sw
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
| - | fence
| - | scall
| + | sbreak

possible bug in pc 2 adder 
