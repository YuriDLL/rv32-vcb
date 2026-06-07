#define OUT ((volatile unsigned int *)0x00001000)

void main(void) {
    unsigned int f0 = 0, f1 = 1;
    OUT[0] = f0;
    OUT[1] = f1;
    for (int i = 2; i < 10; i++) {
        unsigned int fn = f0 + f1;
        OUT[i] = fn;
        f0 = f1;
        f1 = fn;
    }
}
