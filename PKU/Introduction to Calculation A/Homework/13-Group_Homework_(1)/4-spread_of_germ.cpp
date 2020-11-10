#include <iostream>
using namespace std;

int petri_dish[9][9][5] = {0};

void cell_spread(int x, int y, int d) {
    petri_dish[x-1][y-1][d] = petri_dish[x][y][d-1];
    petri_dish[x][y-1][d] = petri_dish[x][y][d-1];
    petri_dish[x+1][y-1][d] = petri_dish[x][y][d-1];
    petri_dish[x-1][y][d] = petri_dish[x][y][d-1];
    petri_dish[x][y][d] = petri_dish[x][y][d-1] * 2;
    petri_dish[x+1][y][d] = petri_dish[x][y][d-1];
    petri_dish[x-1][y+1][d] = petri_dish[x][y][d-1];
    petri_dish[x][y+1][d] = petri_dish[x][y][d-1];
    petri_dish[x+1][y+1][d] = petri_dish[x][y][d-1];
}

int main() {
    int m = 0, n = 0;
    cin >> m >> n;
    petri_dish[4][4][0] = m;
    for (int day = 1; day <= n; day++) {
        for (int i = 0; i < 9; i++)
            ;
    }
}