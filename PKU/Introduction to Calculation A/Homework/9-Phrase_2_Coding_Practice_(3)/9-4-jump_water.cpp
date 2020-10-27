#include<stdio.h>

int main() {
    for (int A = 1; A <= 5; A++) {
        for (int B = 1; B <= 5; B++) {
            for (int C = 1; C <= 5; C++) {
                for (int D = 1; D <= 5; D++) {
                    for (int E = 1; E <= 5; E++) {
                        if (A == B || A == C || A == D || A == E || B == C || 
                            B == D || B == E || C == D || C == E || D == E) {
                                continue;
                        }
                        int AC = int(B == 2) + int(A == 3);
                        int BC = int(B == 2) + int(E == 4);
                        int CC = int(C == 1) + int(D == 2);
                        int DC = int(C == 5) + int(D == 3);
                        int EC = int(E == 4) + int(A == 1);
                        if (AC == 1 && BC == 1 && CC == 1 && DC == 1 && EC == 1)
                        {
                            printf("%d\n%d\n%d\n%d\n%d", A, B, C, D, E);
                            break;
                        }
                    }
                }
            }
        }
    }

    return 0;
}