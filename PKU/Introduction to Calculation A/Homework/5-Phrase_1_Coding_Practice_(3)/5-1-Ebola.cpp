#include<iostream>
using namespace std;



int main() {
    int N = 0, X = 0, Y = 0, K = 0;
    cin >> N >> X >> Y;
    cin >> K;
    int patient_alive[12] = {0}, new_patient[12] = {0};
    patient_alive[1] = N; new_patient[1] = N;
    for (int i = 2; i <= K; i++) {
        patient_alive[i] = patient_alive[i - 1];
        if (i >= Y) {
            patient_alive[i] -= new_patient[i - Y + 1];
        }
        new_patient[i] = patient_alive[i] * X;
        patient_alive[i] += new_patient[i];
    }
    cout << patient_alive[K];
    return 0;
}