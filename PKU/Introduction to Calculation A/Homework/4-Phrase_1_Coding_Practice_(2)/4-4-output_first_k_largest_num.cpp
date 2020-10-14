#include<iostream>
using namespace std;

int main() {
    int no_of_data = 0, array_of_data[1001] = {0},
        k = 0;
    cin >> no_of_data;
    for (int i = 0; i < no_of_data; i++) {
        cin >> array_of_data[i];
    }

    // sorting
    int cur_pos = 0, pt_pos = 0, temp = 0;
    do {
        cur_pos++;
        pt_pos = 0;
        while (pt_pos < cur_pos) {
            if (array_of_data[cur_pos] > array_of_data[pt_pos]) {
                temp = array_of_data[cur_pos];
                for (int i = cur_pos; i > pt_pos; i--) {
                    array_of_data[i] = array_of_data[i - 1];
                }
                array_of_data[pt_pos] = temp;
            }
            pt_pos++;
        }
    } while (cur_pos < no_of_data);

    cin >> k;
    for (int i = 0; i < k; i++) {
        cout << array_of_data[i] << endl;
    }

    return 0;
}