# RV32I VCB Project

## Toolchain
- `riscv64-unknown-elf-gcc` 13.2.0 required (not generic `riscv64-elf-gcc`)
- Assembles RV32I (`-march=rv32i -mabi=ilp32`), links with custom `linker.ld`

## Build Commands
| Command | Action |
|---|---|
| `make` | Build `build/program.vcbmem` from `program.c` + `crt0.s` |
| `make test` | Build `build/test.vcbmem` from `test.s` (optional) |
| `make disasm` | Disassemble `program.elf` with numeric operands |
| `make disasm-test` | Disassemble `test.elf` |
| `make clean` | Remove `build/` |
| `make copy` | Copy `program.vcbmem` to `/mnt/g/Project/fun/rv32i/rv32i.vcbmem` |
| `make get-vcb` | Copy `.vcb` file back from `/mnt/g/Project/fun/rv32i/` |

## C Build Pipeline
`crt0.s` + `program.c` → `crt0.o` + `program.o` (gcc -c) → `program.elf` (ld -T linker.ld) → `program.bin` (objcopy -O binary) → `program.vcbmem` (bin_to_vcbmem.py)

## Assembly Test Pipeline
`test.s` → `test.o` (gcc -c) → `test.elf` (ld -T linker.ld) → `test.bin` (objcopy) → `test.vcbmem` (bin_to_vcbmem.py)

## Testing
- **C program** (`program.c`): default build; executed via `crt0.s` startup (sets SP, clears BSS, calls `main`)
- **Assembly tests** (`test.s`): optional (`make test`); test cases individually commented out
- Success: `a0=0` reaches `ebreak`; failure branches to `error` then `ebreak`
- No automated test runner — load `rv32i.vcb` in Virtual Circuit Board game and run

## C Compilation Flags
- `-march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -mstrict-align`
- `-mstrict-align` required (CPU only supports word-aligned loads/stores)
- `-ffreestanding -nostdlib` — no libc; `ecall` not implemented

## Key Quirks
- `bin_to_vcbmem.py` converts flat binary to big-endian 32-bit words (VCB VMem format)
- `linker.ld`: text origin at 0x0, entry at 0x4 (first 4 bytes reserved); SP at top of 4M RAM
- `sb`/`sh`/`sw` only support **word-aligned** (multiple of 4) addresses
- `fence` and `scall` not implemented; `sbreak` (ebreak) is
- `lb` has known issues with large addresses

## Other Notes
- Source files: `crt0.s`, `program.c`, `test.s`; no package manager, no CI, no linter/formatter/typecheck
- `build/` is gitignored
