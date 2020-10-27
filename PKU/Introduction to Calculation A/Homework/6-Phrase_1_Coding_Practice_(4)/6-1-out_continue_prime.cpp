 #include<iostream>
 using namespace std;

bool is_prime(int n) {
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
    int m = 0, k = 0, count = 0;
    cin >> m >> k;
    bool flag = false;
    for (int i = 1; count < k; i++) {
        if (is_prime(m + i)) {
            if (!flag) {
                cout << (m + i);
                flag = true;
            } else {
                cout << ' ' << (m + i);
            }
            count++;
        }
    }

    return 0;
}