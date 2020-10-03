#include<iostream>
using namespace std;

int main(){
    int a = 0, b = 0, c = 0;
    cin >> a;
    cin >> b;
    cin >> c;
    if (a > b){
        if (a > c){
            cout << a;
        } else {
            cout << c;
        }
    } else {
        if (b > c){
            cout << b;
        } else {
            cout << c;
        }
    }
    return 0;
}