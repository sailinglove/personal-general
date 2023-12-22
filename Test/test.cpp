#include <iostream>

unsigned int convertARGBtoBGRA(unsigned int argb) {
    unsigned int bgra = ((argb & 0xFF00FF00) >> 8) | ((argb & 0x00FF0000) << 8) | (argb & 0x000000FF) | (argb & 0xFF000000);
    return bgra;
}

int main() {
    unsigned int argb = 0xFF112233; // Example ARGB value
    unsigned int bgra = convertARGBtoBGRA(argb);
    std::cout << "BGRA: 0x" << std::hex << bgra << std::endl;
    return 0;
}
