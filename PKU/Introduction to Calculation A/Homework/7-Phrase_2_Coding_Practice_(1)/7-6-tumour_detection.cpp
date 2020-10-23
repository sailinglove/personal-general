#include<iostream>
using namespace std;

int main() {
    int graph[100][100] = {{0},{0}};
    int area = 0, perimeter = 0, N = 0;
    cin >> N;
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cin >> graph[i][j];
        }
    }

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            if (graph[i][j] <= 50) {
                area++;
                if ((i == 0) || (j == 0) || (i == N - 1) || (j == N - 1) ||
                    (graph[i-1][j] > 50) || (graph[i+1][j] > 50) || 
                    (graph[i][j-1] > 50) || (graph[i][j+1] > 50)) {
                        perimeter++;
                    }
            }
        }
    }

    cout << area << ' ' << perimeter << endl;

    return 0;
}