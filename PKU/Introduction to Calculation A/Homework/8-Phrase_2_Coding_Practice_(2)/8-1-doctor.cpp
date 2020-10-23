#include<iostream>
#include<cmath>
using namespace std;

int main() {
    int N = 0, doctors[101] = {0};
    cin >> N;
    for (int i = 1; i <= N; i++) {
        cin >> doctors[i];
    }

    int min = pow(2.0, 4*8.0), min_doc = 0;
    for (int i = 1; i <= N; i++) {
        if (doctors[i] < min) {
            min = doctors[i];
            min_doc = i;
        }
    }

    cout << min_doc << endl;

    return 0;
}