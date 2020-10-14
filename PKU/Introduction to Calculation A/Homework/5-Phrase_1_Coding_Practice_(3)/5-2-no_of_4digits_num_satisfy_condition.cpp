#include<iostream>
using namespace std;

int main() {
    int num = 0, sum = 0;
    cin >> num;
    int array[32] = {0};
    for (int i = 0; i < num; i++) {
        cin >> array[i];
    }
    int thousands = 0, hundreds = 0, 
        tens = 0;
    for (int i = 0; i < num; i++) {
        thousands = array[i] / 1000;
        array[i] %= 1000;
        hundreds = array[i] / 100;
        array[i] %= 100;
        tens = array[i] / 10;
        array[i] %= 10;
        if ((array[i] - thousands - hundreds - tens) > 0) {
            sum++;
        }
    }
    cout << sum;
    return 0;
}