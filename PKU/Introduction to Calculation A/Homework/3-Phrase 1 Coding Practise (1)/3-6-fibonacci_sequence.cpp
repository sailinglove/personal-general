#include<iostream>
using namespace std;

int fibonacci(int index) {
    if ((index == 0) || (index == 1)) {
        // cout << 1;
        return index;
    } else {
        if (index >= 2) {
            // cout << fibonacci(index - 1) + fibonacci(index - 2);
            return fibonacci(index - 1) + fibonacci(index - 2);
        } else return 0;
    }
}

int main() {
    int no_of_data = 0, data_arr[20] = {0};
    cin >> no_of_data;
    for (int i = 0; i < no_of_data; i++) {
        cin >> data_arr[i];
    }
    for (int i = 0; i < no_of_data; i++) {
        cout << fibonacci(data_arr[i]) << endl;
    }
    
    return 0;
}