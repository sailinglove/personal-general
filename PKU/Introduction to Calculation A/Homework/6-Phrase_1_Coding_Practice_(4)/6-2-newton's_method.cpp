#include<iostream>
#include<iomanip>
#include<cmath>
using namespace std;

// double newtonsMethod(double num, int &count) {
//     double x = num, root = 0;
//     while (true) {
//         count++;
//         root = 0.5 * (x + (num / x));
//         if (abs(root - x) < 0.000001) {
//             break;
//         }
//         x = root;
//     }
//     return root;
// }

int main() {
    double n = 0;
    while (cin >> n) {
        int count = 0;
        double x = n, root = 0;
        while (true) {
            count++;
            root = 0.5 * (x + (n / x));
            if (fabs(root - x) < 0.000001) {
                break;
            }
            x = root;
        }
        cout << count << ' ' << setprecision(2) << setiosflags(ios::fixed) << root << endl;
    }
    return 0;
}