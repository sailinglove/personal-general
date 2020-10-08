#include<iostream>
using namespace std;

// int find_max(int array[] = {0}) {
//     int max = 0, len = sizeof(array)/sizeof(array[0]);
//     for (int i = 0; i <= len; i++) {
//         if (array[i] > array[max]) {
//             max = i;
//         }
//     }
//     return max;
// }

int main() {
    int votes[100] = {0}, doctors[16] = {0};
    int no_of_votes = 0;
    cin >> no_of_votes;
    for (int i = 0; i <= (no_of_votes - 1); i++) {
        cin >> votes[i];
    }
    for (int i = 0; i <= (no_of_votes - 1); i++) {
        doctors[votes[i]]++;
    }
    int max = 0;
    for (int i = 0; i < 16; i++) {
        if (doctors[i] > doctors[max]) {
            max = i;
        }
    }
    cout << max << endl;

    return 0;
}