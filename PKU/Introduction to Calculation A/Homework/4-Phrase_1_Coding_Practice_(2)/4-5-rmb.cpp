#include<iostream>
using namespace std;

int mod(int& balance, int value = 100) {
    int no = (balance / value);
    balance %= value;
    return no;
}

int main(){
    int balance = 0;
    cin >> balance;
    cout << mod(balance, 100) << endl;
    cout << mod(balance, 50) << endl;
    cout << mod(balance, 20) << endl;
    cout << mod(balance, 10) << endl;
    cout << mod(balance, 5) << endl;
    cout << mod(balance, 1) << endl;
    return 0;
}