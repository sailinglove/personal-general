#include<iostream>
using namespace std;

bool isPrime(int n) {
    if (n == 1) {
        return false;
    } else if (n == 2) {
        return true;
    } else {
        bool flag = true;
        for (int i = 2; i <= (n / 2 + 1); i++) {
            if ((n % i) == 0) {
                flag = false;
                break;
            }
        }
        return flag;
    }
}

int main() {
    int m = 0, n = 0;
    char c;
    cin >> m >> c >> n;

    bool flag = false;

    for (int i = m; i <= n; i++) {
        if (isPrime(i)) {
            for (int j = i + 1; j <= n; j++) {
                if (isPrime(j)) {
                    if (isPrime(j - i)) {
                        cout << '(' << i << ',' << j << ')' << endl;
                        flag = true;
                    }
                }
            }
        }
    }

    if (!flag) {
        cout << "NULL" << endl;
    }
    
    return 0;
}