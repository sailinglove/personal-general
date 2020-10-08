#include<iostream>
using namespace std;

char p_s_r(int fa = 0, int fb = 0) {
    switch (fa) {
        case 0:
            if (fb == 0) return 'T'; else if (fb == 1) return 'A'; else if (fb == 2) return 'B';
            break;
        case 1:
            if (fb == 0) return 'B'; else if (fb == 1) return 'T'; else if (fb == 2) return 'A';
            break;
        case 2:
            if (fb == 0) return 'A'; else if (fb == 1) return 'B'; else if (fb == 2) return 'T';
            break;
    }
}

int main() {
    int times = 0;
    int a = 0, b = 0, a_counter = 0, b_counter = 0;
    cin >> times;
    for (int i = 0; i < times; i++) {
        cin >> a >> b;
        switch (p_s_r(a, b)) {
            case 'A':
                a_counter++;
                break;
            case 'B':
                b_counter++;
                break;
        }
    }
    if (a_counter > b_counter) {
        cout << 'A';
    } else if (b_counter > a_counter) {
        cout << 'B';
    } else {
        cout << "Tie";
    }
    cout << endl;

    return 0;
}