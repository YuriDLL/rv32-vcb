# RV32I VCB Project

## Toolchain
- `riscv64-unknown-elf-gcc` 13.2.0 required (not generic `riscv64-elf-gcc`)
- Assembles RV32I (`-march=rv32i -mabi=ilp32`), links with custom `linker.ld`

## Build Commands
| Command | Action |
|---|---|
| `make` | Build `build/test.vcbmem` from `test.s` |
| `make disasm` | Disassemble `test.elf` with numeric operands |
| `make clean` | Remove `build/` |
| `make copy` | Copy `.vcbmem` to `/mnt/g/Project/fun/rv32i/rv32i.vcbmem` (WSL cross-mount) |
| `make get-vcb` | Copy `.vcb` file back from `/mnt/g/Project/fun/rv32i/` |

## Build Pipeline
`test.s` → `test.o` (gcc -c) → `test.elf` (ld) → `test.bin` (objcopy -O binary) → `test.vcbmem` (bin_to_vcbmem.py)

## Testing
- Tests are written in assembly (`test.s`) and execute on the VCB CPU inside the game
- Test cases are individually commented out; uncomment to enable
- Success: `a0=0` reaches `ebreak`; failure branches to `error` then `ebreak`
- No automated test runner — load `rv32i.vcb` in Virtual Circuit Board game and run

## Key Quirks
- `bin_to_vcbmem.py` converts flat binary to big-endian 32-bit words (VCB VMem format)
- `linker.ld`: text origin at 0x0, entry at 0x4 (first 4 bytes reserved)
- `jalr` and branch compare inversions (`blt`/`bge`/`bltu`/`bgeu`) are NOT yet implemented
- `sb`/`sh`/`sw` only support **word-aligned** (multiple of 4) addresses — no halfword/byte alignment
- `fence` and `scall` not implemented; `sbreak` (ebreak) is
- `lb` has known issues with large addresses

## Other Notes
- Single source file (`test.s`); no package manager, no CI, no linter/formatter/typecheck
- `build/` is gitignored
