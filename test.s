.section .rodata
.balign 4
lw_test_const:
    .word 0x8234868A

.section .text
.global _start

_start:
# #test lw
#     addi a0, a0, 1 # test counter
#     la t0, lw_test_const
#     lw t1, 0(t0)
#     li t2, 0x8234868A
#     bne t1, t2, error

# #test lh
#     addi a0, a0, 1 # test counter
#     la t0, lw_test_const
#     lh t1, 0(t0)
#     li t2, 0xFFFF868A
#     bne t1, t2, error

# #test lb
#     addi a0, a0, 1 # test counter
#     la t0, lw_test_const
#     lb t1, 0(t0)
#     li t2, 0xFFFFFF8A
#     bne t1, t2, error

# #test lhu
#     addi a0, a0, 1 # test counter
#     la t0, lw_test_const
#     lhu t1, 0(t0)
#     li t2, 0x0000868A
#     bne t1, t2, error

# #test lbu
#     addi a0, a0, 1 # test counter
#     la t0, lw_test_const
#     lbu t1, 0(t0)
#     li t2, 0x0000008A
#     bne t1, t2, error

# #test or
#     addi a0, a0, 1 # test counter
#     li t0, 0xAAAAAAAA
#     li t1, 0xffffffff
#     or t2, t0, t1
#     li t3, 0xffffffff
#     bne t2, t3, error

# #test and
#     addi a0, a0, 1 # test counter
#     li t0, 0xAAAAAAAA
#     li t1, 0x000F0000
#     and t1, t0, t1
#     li t2, 0x000A0000
#     bne t1, t2, error

# #test xor
#     addi a0, a0, 1 # test counter
#     li t0, 0xAAAAAAAA
#     li t1, -1
#     xor t2, t0, t1
#     li t3, 0x55555555
#     bne t2, t3, error

# #test sltu
#     addi a0, a0, 1 # test counter
#     li t0, -5
#     li t1, 1
#     sltu t2, t0, t1
#     bnez t2, error

#     addi a0, a0, 1 # test counter
#     li t0, 1
#     li t1, -5
#     sltu t2, t0, t1
#     beqz t2, error

# #test slt
#     addi a0, a0, 1 # test counter
#     li t0, -0x1fffffff
#     li t1, 0x1fffffff
#     slt t2, t0, t1
#     beqz t2, error

#     addi a0, a0, 1 # test counter
#     li t0, 0x1fffffff
#     li t1, -0x1fffffff
#     slt t2, t0, t1
#     bnez t2, error

# #test sll
#     addi a0, a0, 1 # test counter
#     li t0, 0xAAAAAAAA
#     li t1, 1
#     sll t1, t0, t1
#     li t2, 0x55555554
#     bne t1, t2, error

# #test srl
#     addi a0, a0, 1
#     li t0, 0xAAAAAAAA
#     li t1, 1
#     srl t1, t0, t1
#     li t2, 0x55555555
#     bne t1, t2, error

# #test sra
#     addi a0, a0, 1
#     li t0, 0xAAAAAAAA
#     li t1, 1
#     sra t1, t0, t1
#     li t2, 0xD5555555
#     bne t1, t2, error

#     addi a0, a0, 1
#     li t0, 0xA0000000
#     li t1, 31
#     sra t1, t0, t1
#     li t2,  0xFFFFFFFF
#     bne t1, t2, error

    # addi a0, a0, 1
    # li t0, 0xA0000000
    # li t1, 28
    # sra t1, t0, t1
    # li t2,  0xFFFFFFFA
    # bne t1, t2, error

# #test slli
#     addi a0, a0, 1
#     li t0, 0xAAAAAAAA
#     slli t1, t0, 1
#     li t2, 0x55555554
#     bne t1, t2, error

# #test srli
#     addi a0, a0, 1
#     li t0, 0xAAAAAAAA
#     srli t1, t0, 1
#     li t2, 0x55555555
#     bne t1, t2, error

# #test srai
#     addi a0, a0, 1
#     li t0, 0xAAAAAAAA
#     srai t1, t0, 1
#     li t2, 0xD5555555
#     bne t1, t2, error

#     addi a0, a0, 1
#     li t0, 0xA0000000
#     srai t1, t0, 31
#     li t2,  0xFFFFFFFF
#     bne t1, t2, error

    # addi a0, a0, 1
    # li t0, 0xA0000000
    # srai t1, t0, 28
    # li t2,  0xFFFFFFFA
    # bne t1, t2, error

# #test xori
#     li t0, 0xAAAAAAAA
#     xori t1, t0, -1
#     li t2, 0x55555555
#     bne t1, t2, error

# #test ori
#     li t0, 0xAAAAAAAA
#     ori t1, t0, -1
#     li t2, -1
#     bne t1, t2, error

# #test andi
#     li t0, 0xAAAAAAAA
#     andi t1, t0, -2048
#     li t2, 0xAAAAA800
#     bne t1, t2, error

# #test slti
#     li t0, -5
#     slti t1, t0, 1
#     beqz t1, error

#     li t0, 1
#     slti t1, t0, -5
#     bnez t1, error

# #test sltiu
#     li t0, -5
#     sltiu t1, t0, 1
#     bnez t1, error

#     li t0, -5
#     sltiu t1, t0, -1
#     beqz t1, error

# # test auipc
#     auipc t0, 0
#     auipc t1, 5
#     sub t2, t1, t0
#     li t3, 20484
#     bne t2, t3, error

# #test jal
#     addi a0, a0, 1 # test counter
#     jal     ra, test_jal_target
#     j       error
# test_jal_target:
#     la      t4, test_jal_target
#     addi    t4, t4, -4
#     bne     ra, t4, error

# # test lui, addi
#     lui     t0, 0xfffff
#     addi    t0, t0, 2047
#     addi    t0, t0, 2047
#     addi    t0, t0, 2
#     bne     t0, zero, error

# #test bne
#     li      t0, 5
#     li      t1, 5
#     bne     t0, t1, error

# #test add
#     li      t0, 5
#     li      t1, 3
#     add     t2, t0, t1
#     li      t3, 8
#     bne     t2, t3, error

#test sub
    # li      t0, -5
    # li      t1, 5
    # sub     t2, t0, t1
    # li      t3, -10
    # bne     t2, t3, error

#good end
    li      a0, 0
    j       end

error:
end:
    ebreak
    j       end
