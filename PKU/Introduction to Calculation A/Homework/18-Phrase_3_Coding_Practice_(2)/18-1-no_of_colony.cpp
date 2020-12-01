#include <iostream>
using namespace std;

//global varible
int photo[101][101] = {0}; //photo varible
bool visited[101][101] = {0}; //visited 
int colonies[101][101] = {0};

void inputPhoto(int height, int width) {
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            cin >> photo[i][j];
        }
    }
}

// void printPhoto(int height, int width) {
//     for (int i = 0; i < height; i++) {
//         for (int j = 0; j < width; j++) {
//             cout << ' ' << photo[i][j];
//         }
//         cout << endl;
//     }
// }

int main() {
    int n = 0, m = 0;
    cin >> n >> m;
    inputPhoto(n, m);

}