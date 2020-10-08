#include<iostream>
using namespace std;

int main() {
    int no, a[100] = {0};
    cin >> no;
    for (int i = 0; i < no; i++) {
        cin >> a[i];
    }
    int cur_pos = 0, pt_pos, temp;
    do {
        cur_pos++;
        pt_pos = 0;
        while (pt_pos < cur_pos) {
            if (a[cur_pos] > a[pt_pos]) {
                temp = a[cur_pos];
                for (int i = cur_pos; i > pt_pos; i--) {
                    a[i] = a[i - 1];
                }
                a[pt_pos] = temp;
            }
            pt_pos++;
        }
    } while (cur_pos < no);
    for (int i = 0; i < no; i++) {
        cout << a[i];
    }
    cout << endl;
    
    return 0;
}