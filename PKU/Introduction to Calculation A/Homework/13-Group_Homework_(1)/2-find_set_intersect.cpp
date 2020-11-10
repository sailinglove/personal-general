#include <iostream>
using namespace std;

int main() {
    int A[100] = {0}, B[100] = {0};
    char c;
    for (int i = 0; ; i++) {
        cin >> A[i] >> c;
        if (c == '\n') {
            break;
        }
    }
    for (int i = 0; ; i++) {
        cin >> B[i] >> c;
        if (c == '\n') {
            break;
        }
    }

    return 0;
}