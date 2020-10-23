#include<stdio.h>
// using namespace std;

bool mod_3(int num) {
    if ((num % 3) == 0) 
        return true;
    else
        return false;
}

bool contain_3(int n) {
    if ((n / 10) == 3)
        return true;
    else if ((n % 10) == 3)
        return true;
    else return false;
}

int main() {
    int n = 0;
    while(scanf("%d",&n)!=EOF) {
        if (mod_3(n) || contain_3(n))
            printf("TRUE\n");
        else 
            printf("FALSE\n");
    }

    return 0;
}