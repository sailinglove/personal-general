#include<iostream>
using namespace std;

int main() {
    char c = ' ';
    cin >> c;
    int n = c;
    if ((n >= 65) && (n <= 90)) {
        cout << "upper case";
    } else if ((n >= 97) && (n <= 122)) {
        cout << "lower case";
    } else {
        cout << "invalid input";
    }
    
    return 0;
}