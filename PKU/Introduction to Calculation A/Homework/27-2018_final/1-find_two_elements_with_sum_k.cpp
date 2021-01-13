#include <iostream>
using namespace std;

int main() {
    int n = 0, k = 0;
    int num[1000] = {0};
    bool flag = false;
    cin >> n >> k;

    for (int i = 0; i < n; i++)
        cin >> num[i];

    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 2; j++) {
            if (num[i] == num[i+j])
                continue;
            if ((num[i] + num[i+j]) == k) {
                flag = true;
                break;
            }
        }
    }

    if (flag)
        cout << "yes" << endl;
    else
        cout << "no" << endl;

    return 0;
}