#include <stdio.h>

int main()
{
    for (int i = 0; i < 100; i = i + 1)
    {
        if (i % 2 != 0)
            printf("%d\n", i);
    }
}