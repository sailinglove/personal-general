#include<iostream>
using namespace std;

bool multiple(int testee = 0, int testor = 3) {
    if ((testee % testor) == 0) {
        return true;
    } else {
        return false;
    }
}

int main() {
    int num = 0;
    bool flag = false;
    cin >> num;
    for (int i = 3; i <= 7; i += 2) {
        if (multiple(num, i)) {
            if (flag) {
                cout << " ";
            }
            cout << i;
            flag = true;
        }
    }
    if (! flag) {
        cout << "n";
    }
    cout << endl;
    return 0;
}