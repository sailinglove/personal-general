#include<iostream>
using namespace std;

int main() {
    int bad_jump = 0, good_jump[20] = {0},
        time = 0, count = 0;
    cin >> bad_jump;
    for (int i = 0; i < bad_jump; i++) {
        cin >> good_jump[i];
    }
    int jump_count[20] = {0};
    jump_count[0] = good_jump[0];
    for (int i = 1; i < bad_jump; i++) {
        jump_count[i] = good_jump[i] - good_jump[i - 1];
    }
    bool flag = false;
    for (int i = 0; i < bad_jump; i++) {
        while (jump_count[i] > 0) {
            jump_count[i]--;
            time++;
            count++;
            if (time >= 60) {
                flag = true;
                break;
            }
        }
        if (time >= 60) {
            break;
        }
        time += 3;
    }
    if ((!flag) && (time < 60)) {
        count += 60 - time;
    }
    if (bad_jump == 0) {
        cout << 60 << endl;
    } else {
        cout << count << endl;
    }
    return 0;
}