#include<iostream>

int main() {
    int n = 0, num = 0, apperence[101] = {0};
    std::cin >> n;
    for (int i = 1; i <= n; i++) {
        std::cin >> num;
        apperence[num]++;
    }

    for (int i = 1; i < 101; i++) {
        if ((apperence[i] % 2) == 1) {
            std::cout << i << std::endl;
            break;
        }
    }

    return 0;
}