// #include <iostream>
// using namespace std;
#include<stdio.h>

int main() {
    float p3x = -1, p3y = 1, p2x = 1, p2y = 1,
          p4x = -1, p4y = -1, p1x = 1, p1y = -1;
    float x = 0, y = 0;
    char c;
    bool flag = false;
    // cin >> x >> c >> y;
    scanf("%f,%f", &x, &y);
    if ((x > -1) && (x < 1)) {
        if ((y > -1) && (y < 1)) {
            flag = true;
        }
    }
    if (flag) {
        // cout << "yes";
        printf("yes");
    } else {
        // cout << "no";
        printf("no");
    }

    return 0;
}