#include <iostream>
using namespace std;

bool isLeap(int year) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
        return true;
    else
        return false;
}

int loopDays() {

}

int loopMonths(int start, int end, int cases = 1, bool leap = false) {
    for (int m = start; m <= end; m++) {
        loopDays();
    }
}

int loopYears(int start, int end){
    for (int y = start; y <= end; y++) {
        loopMonths(1, 12);
    }
}

int findDays(int start[3], int end[3]) {
    bool sLeap = isLeap(start[0]), eLeap = isLeap(end[0]);
    if (start[0] < (end[0] - 1)) {
        loopMonths(start[1], 12, sLeap);
        loopYears(start[0] + 1, end[0] - 1);
        loopMonths(1, end[1]);
    } else if (start[0] == (end[0] - 1)) {
        loopMonths(start[1], 12);
        loopMonths(1, end[1]);
    } else if (start[0] == end[0]) {
        loopMonths(start[1], end[1]);
    }
}

int main() {
    int startDate[3] = {0}, endDate[3] = {0};
    cin >> startDate[0] >> startDate[1] >> startDate[2];
    cin >> endDate[0] >> endDate[1] >> endDate[2];

}