#include<iostream>
using namespace std;

int sumOfDigits(int n) {
    int digits[5] = {0};
    digits[0] = n / 10000;
    digits[1] = (n % 10000) / 1000;
    digits[2] = (n % 1000) / 100;
    digits[3] = (n % 100) / 10;
    digits[4] = n % 10;
    int sum = 0;
    for (int i = 0; i < 5; i++) {
        sum += digits[i];
    }
    return sum;
}

// void divide() {

// }

int main() {
    int m = 0, n = 0, k = 0;
    char blackhole;
    cin >> m >> blackhole >> n >> blackhole >> k;
    int i = 0;
    while (true) {
        i++;
        bool flag = false;
        for (int j = m + 1; j < n; j++) {
            if (sumOfDigits(j) == k*i) {
                if (!flag) {
                    cout << j;
                    flag = true;
                } else {
                    cout << "," << j;
                }
            }
        }
        if (flag) {
            cout << endl;
        }

        if (k*i > 36) {
            break;
        }
    }

    return 0;
}