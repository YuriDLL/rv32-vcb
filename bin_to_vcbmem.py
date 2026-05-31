# bin_to_vcbmem.py
import sys

def convert_bin_to_vcbmem(input_file, output_file):
    with open(input_file, 'rb') as f:
        data = f.read()
    
    # Дополняем до кратности 4 байт
    padding = (4 - len(data) % 4) % 4
    data += b'\x00' * padding
    
    with open(output_file, 'wb') as f:
        # Обрабатываем по 4 байта (32-битные слова)
        for i in range(0, len(data), 4):
            # Little-endian: байты [b0, b1, b2, b3] -> word = b3<<24 | b2<<16 | b1<<8 | b0
            b0 = data[i]
            b1 = data[i + 1]
            b2 = data[i + 2]
            b3 = data[i + 3]
            # Записываем в big-endian порядке
            word_bytes = bytes([b3, b2, b1, b0])
            f.write(word_bytes)
    
    print(f'Converted {input_file} ({len(data)} bytes) -> {output_file} ({len(data)//4} words)')

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python bin_to_vcbmem.py <input.bin> <output.vcbmem>')
        sys.exit(1)
    
    convert_bin_to_vcbmem(sys.argv[1], sys.argv[2])