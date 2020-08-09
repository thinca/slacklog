#include <stdio.h>
#include <stdint.h>
#define SPLITMIX32(a, b) ( \
    (b) = ((a) += 0x9e3779b9), \
    (b) = ((b) ^ ((b) >> 16)) * 0x85ebca6b, \
    (b) = ((b) ^ ((b) >> 13)) * 0xc2b2ae35, \
    (b) ^ ((b) >> 16) \
    )
int main()
{
    uint32_t a = 0, b = 0;
    uint32_t x, y, z, w;

    // srand
    x = SPLITMIX32(a, b);
    y = SPLITMIX32(a, b);
    z = SPLITMIX32(a, b);
    w = SPLITMIX32(a, b);
    printf("%08x\n%08x\n%08x\n%08x\n", x, y, z, w);

    // rand() init
    x = 0;
    x = SPLITMIX32(x, z);
    y = SPLITMIX32(x, z);
    z = SPLITMIX32(x, z);
    w = SPLITMIX32(x, z);
    printf("%08x\n%08x\n%08x\n%08x\n", x, y, z, w);
}