#include<iostream>
#include<iomanip>
using namespace std;

int main(){
    float a;
    cin >> a;
    if (a < 0)
        a = -a;
    cout << setiosflags(ios::fixed) << setprecision(2) << a << endl;
}