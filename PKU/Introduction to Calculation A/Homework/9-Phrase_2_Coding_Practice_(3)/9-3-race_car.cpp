#include<stdio.h>

int main() {
    bool comment[5] = {false};
    for (int best = 1; best <= 4; best++) {
        comment[1] = (best == 2);
        comment[2] = (best == 4);
        comment[3] = !(best == 3);
        comment[4] = !comment[2];
        int correct = 0, no_correct = 0;
        for (int j = 1; j <= 4; j++) {
            if (comment[j]) {
                correct = j;
                no_correct++;
            }
        }
        if (no_correct == 1) {
            printf("%d\n%c", best, (64 + correct));
        }
    }

    return 0;
}