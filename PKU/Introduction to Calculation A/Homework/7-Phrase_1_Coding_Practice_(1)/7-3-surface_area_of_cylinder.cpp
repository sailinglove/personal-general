#include<stdio.h>

#define pi 3.14159

int main() {
    double r = 0, h = 0;
    scanf("%lf %lf", &r, &h);
    double area = 0;
    area = 2 * pi * r * r + 2 * pi * r * h;
    printf("Area = %.3f", area);
    return 0;
}