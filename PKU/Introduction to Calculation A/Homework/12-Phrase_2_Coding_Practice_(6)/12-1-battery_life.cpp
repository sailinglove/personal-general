#include <iostream>
#include <iomanip>
#include <stdio.h>
using namespace std;

#define MAX_N 1001

//global variables
int batteries[MAX_N] = {0};

int main()
{
    int n = 0;
    while (cin >> n)
    {
        int sum = 0, max = 0;
        for (int i = 0; i < n; i++)
        {
            cin >> batteries[i];
            sum += batteries[i];
            if (max < batteries[i])
                max = batteries[i];
        }
        if (max <= sum /2 )
            printf("%.1f\n", sum / 2.0);
        else
            printf("%.1f\n", (sum - max) * 1.0);
    }
    return 0;
}