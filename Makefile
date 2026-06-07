RISCV_PREFIX = riscv64-unknown-elf
BUILD_DIR = build

ASFLAGS = -march=rv32i -mabi=ilp32
CFLAGS = -march=rv32i -mabi=ilp32 -ffreestanding -nostdlib -mstrict-align

all: $(BUILD_DIR)/program.vcbmem copy

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# --- C program (default) ---
$(BUILD_DIR)/crt0.o: crt0.s | $(BUILD_DIR)
	$(RISCV_PREFIX)-gcc -c $(ASFLAGS) $< -o $@

$(BUILD_DIR)/program.o: program.c | $(BUILD_DIR)
	$(RISCV_PREFIX)-gcc -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/program.elf: $(BUILD_DIR)/crt0.o $(BUILD_DIR)/program.o linker.ld | $(BUILD_DIR)
	$(RISCV_PREFIX)-ld -m elf32lriscv $(BUILD_DIR)/crt0.o $(BUILD_DIR)/program.o -T linker.ld -o $@

$(BUILD_DIR)/program.bin: $(BUILD_DIR)/program.elf | $(BUILD_DIR)
	$(RISCV_PREFIX)-objcopy -O binary $< $@

$(BUILD_DIR)/program.vcbmem: $(BUILD_DIR)/program.bin | $(BUILD_DIR)
	python3 bin_to_vcbmem.py $< $@

# --- Assembly test (optional) ---
test: $(BUILD_DIR)/test.vcbmem

$(BUILD_DIR)/test.o: test.s | $(BUILD_DIR)
	$(RISCV_PREFIX)-gcc -c -march=rv32i -mabi=ilp32 $< -o $@

$(BUILD_DIR)/test.elf: $(BUILD_DIR)/test.o linker.ld | $(BUILD_DIR)
	$(RISCV_PREFIX)-ld -m elf32lriscv $(BUILD_DIR)/test.o -T linker.ld -o $@

$(BUILD_DIR)/test.bin: $(BUILD_DIR)/test.elf | $(BUILD_DIR)
	$(RISCV_PREFIX)-objcopy -O binary $< $@

$(BUILD_DIR)/test.vcbmem: $(BUILD_DIR)/test.bin | $(BUILD_DIR)
	python3 bin_to_vcbmem.py $< $@

disasm: $(BUILD_DIR)/program.elf
	$(RISCV_PREFIX)-objdump -d -M numeric $<

disasm-test: $(BUILD_DIR)/test.elf
	$(RISCV_PREFIX)-objdump -d -M numeric $<

clean:
	rm -rf $(BUILD_DIR)

copy: $(BUILD_DIR)/program.vcbmem
	cp $(BUILD_DIR)/program.vcbmem /mnt/g/Project/fun/rv32i/rv32i.vcbmem

get-vcb:
	cp /mnt/g/Project/fun/rv32i/rv32i.vcb .

.PHONY: all clean copy disasm disasm-test test
