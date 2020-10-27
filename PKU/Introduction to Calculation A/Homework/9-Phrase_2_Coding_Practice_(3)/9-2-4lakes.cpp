#include<iostream>
using namespace std;

int main() {
    for (int poyang = 1; poyang <= 4; poyang++) {
        for (int dongting = 1; dongting <= 4; dongting++) {
            for (int tai = 1; tai <= 4; tai++) {
                for (int hongze = 1; hongze <= 4; hongze++) {
                    if (poyang == dongting || poyang == tai ||
                        poyang == hongze || dongting == tai || 
                        dongting == hongze || tai == hongze) {
                            continue;
                    }
                    int A = (int)(dongting == 1) + (int)(hongze == 4) + 
                            (int)(poyang == 3);
                    int B = (int)(hongze == 1) + (int)(dongting == 4) + 
                            (int)(poyang == 2) + (int)(tai == 3);
                    int C = (int)(hongze == 4) + (int)(dongting == 3);
                    int D = (int)(poyang == 1) + (int)(tai == 4) + 
                            (int)(hongze == 2) + (int)(dongting == 3);
                    if (A == 1 && B == 1 && C == 1 && D == 1) {
                        cout << poyang << endl << dongting << endl << tai
                             << endl << hongze << endl;
                        break;
                    }
                }
            }
        }
    }

    return 0;
}