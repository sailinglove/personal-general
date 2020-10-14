#include<iostream>
using namespace std;

int find_max(int n[3]){
    int max = n[0];
    for (int i = 0; i < 3; i++) {
        if (n[i] > max) {
            max = n[i];
        }
    }
    return max;
}

int find_min(int n[3]){
    int min = n[0];
    for (int i = 0; i < 3; i++) {
        if (n[i] < min) {
            min = n[i];
        }
    }
    return min;
}

int main() {
    int num[3] = {0};
    for (int i = 0; i < 3; i++) {
        cin >> num[i];
    }
    cout << find_max(num) - find_min(num) << endl;
    return 0;
}