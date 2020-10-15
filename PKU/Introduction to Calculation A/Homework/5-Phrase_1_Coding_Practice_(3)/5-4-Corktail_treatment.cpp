#include<iostream>
using namespace std;

float percentage(int n1, int n2) {
    return (1.0*n2 / n1);
}

char comparison(float o_treatment, float n_treatment) {
    if ((o_treatment - n_treatment) > 0.05) {
        return 'w';
    } else if ((n_treatment - o_treatment) > 0.05) {
        return 'b';
    } else
        return 's';
}

int main() {
    int num = 0;
    int total_arr[20] = {0}, effective_arr[20] = {0};
    float percentage_arr[20] = {0};
    cin >> num;
    for (int i = 0; i < num; i++) {
        cin >> total_arr[i] >> effective_arr[i];
    }
    for (int i = 0; i < num; i++) {
        percentage_arr[i] = percentage(total_arr[i], effective_arr[i]);
    }
    for (int i = 1; i < num; i++) {
        switch (comparison(percentage_arr[0], percentage_arr[i])) {
        case 'w':
            cout << "worse";
            break;
        case 'b':
            cout << "better";
            break;
        case 's':
            cout << "same";
            break;
        }
        cout << endl;
    }
    return 0;
}