#include<iostream>
using namespace std;

int find_max(int n[100]){
    int max = n[0];
    for (int i = 1; i < 100; i++) {
        if (n[i] > max) {
            max = n[i];
        }
    }
    return max;
}

int main() {
    int no_of_data = 0, num[100] = {0};
    cin >> no_of_data;
    for (int i = 0; i < no_of_data; i++) {
        cin >> num[i];
    }
    int max = find_max(num), sum = 0;
    for (int i = 0; i < 100; i++) {
        if (num[i] != max) {
            sum += num[i];
        }
    }
    cout << sum << endl;
    return 0;
}