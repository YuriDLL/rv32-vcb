RISCV_PREFIX = riscv64-unknown-elf

BUILD_DIR = build

all: $(BUILD_DIR)/test.vcbmem copy

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/test.o: test.s | $(BUILD_DIR)
	$(RISCV_PREFIX)-gcc -c -march=rv32i -mabi=ilp32 $< -o $@

$(BUILD_DIR)/test.elf: $(BUILD_DIR)/test.o linker.ld | $(BUILD_DIR)
	$(RISCV_PREFIX)-ld -m elf32lriscv $< -T linker.ld -o $@

$(BUILD_DIR)/test.bin: $(BUILD_DIR)/test.elf | $(BUILD_DIR)
	$(RISCV_PREFIX)-objcopy -O binary $< $@

$(BUILD_DIR)/test.vcbmem: $(BUILD_DIR)/test.bin | $(BUILD_DIR)
	python3 bin_to_vcbmem.py $< $@

disasm: $(BUILD_DIR)/test.elf
	$(RISCV_PREFIX)-objdump -d -M numeric $<

clean:
	rm -rf $(BUILD_DIR)

copy: $(BUILD_DIR)/test.vcbmem
	cp $(BUILD_DIR)/test.vcbmem /mnt/g/Project/fun/rv32i/rv32i.vcbmem

get-vcb:
	cp /mnt/g/Project/fun/rv32i/rv32i.vcb .

.PHONY: all clean copy disasm