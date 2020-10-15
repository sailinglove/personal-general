#include<iostream>
#include<iomanip>
using namespace std;

int factorial(int num) {
    if (num == 1) {
        return 1;
    } else {
        return factorial(num-1) * num;
    }
}

int main() {
    int n = 0;
    cin >> n;
    double e = 1;
    for (int i = 1; i <= n; i++) {
        e += (1.0 / factorial(i));
    }
    cout << fixed << setprecision(6) << e << endl;
    return 0;
}