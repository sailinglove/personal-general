#include<iostream>
using namespace std;

bool is_7_multiple(int n) {
    if ((n % 7) == 0) {
        return true;
    } else {
        return false;
    }
}

bool contain_7(int n) {
    if ((n / 100) == 7) {
        return true;
    } else if (((n % 100) / 10) == 7) {
        return true;
    } else if ((n % 10) == 7) {
        return true;
    } else return false;
}

int main() {
    int num = 0, i = 0;
    cin >> num;
    int data[100] = {0}, next[100] = {-999}, previous[100] = {-999};

    //init linked list
    for (int i = 0; i < num; i++) {
        data[i] = i + 1;
        next[i] = i + 1;
        previous[i] = i - 1;
    }
    next[num - 1] = 0;
    previous[0] = num - 1;

    int count = 0, pointer = 0, size  = num;

    while (true) {
        count++;
        if (is_7_multiple(count) || contain_7(count)) {
            cout << data[pointer] << endl;
            next[previous[pointer]] = next[pointer];
            previous[next[previous[pointer]]] = previous[pointer];
            size--;
            if (size == 0) {
                break;
            }
        }
        pointer = next[pointer];
    }

    return 0;
}