#include <iostream>
using namespace std;

//global variables

int system_convert(int base_sys, int target_sys, int &num){
    cnt=0;
    dec=0;
    for(i=(strlen(oct)-1);i>=0;i--)
    {
        dec= dec+ (oct[i]-0x30)*pow((double)8,(double)cnt);
        cnt++;
    }
}

int main() {
    
    return 0;
}