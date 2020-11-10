#include <iostream>
using namespace std;

int sudoku[22][22] = {0};

int main() {
    int n = 0;
    cin >> n;
    int x = n/2, y = 0;
    sudoku[x][y] = 1;

    for (int i = 2; i <= n * n; i++) {
        if ((x != (n-1)) && (y != 0) && (sudoku[x+1][y-1] == 0)) {
            x++;
            y--;
            sudoku[x][y] = i;
        } else if (((x == (n-1)) && (y == 0)) || (sudoku[x+1][y-1] != 0)) {
            y++;
            sudoku[x][y] = i;
        } else if ((x != (n-1)) && (y == 0)) {
            x++;
            y = (n-1);
            sudoku[x][y] = i;
        } else if ((x == (n-1)) && (y != 0)) {
            x = 0;
            y--;
            sudoku[x][y] = i;
        }
    }

    bool flag;
    for (int i = 0; i < n; i++) {
        flag = false;
        for (int j = 0; j < n; j++) {
            if (flag)
                cout << ' ' << sudoku[j][i];
            else {
                flag = true;
                cout << sudoku[j][i];
            }
        }
        cout << endl;
    }

    return 0;
}