#include <iostream>
using namespace std;

// int prime[100000] = {0};
int num[100000][100000] = {0};
int n = 0;

// void gen_prime() {
//     bool flag = false;
//     for (int i = 1; i <= n; i++) {
//         flag = false;
//         for (int j = 1; j <= sqrt(i) + 1; j++) {
//             if ((i % j) == 0) {
//                 flag = true;
//                 break;
//             }
//         }
//     }
// }

int main() {
    cin >> n;
    for (int i = 0; i <= n; i++) {
        for (int j = 0; j <= sqrt(n) + 1; j++) {
            if ((i % j) == 0) {
                
            }
        }
    }
}