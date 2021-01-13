#include <iostream>
using namespace std;

//global variables
bool like_friend_matrix[201][201] = {0};
int n = 0, m = 0;


void input(){
    cin >> n >> m;

    for (int i = 0; i < n; i++){
        for (int j = 0; j < m; j++){
            cin >> like_friend_matrix[i][j];
        }
    }
}

int main() {
    int T = 0, freak_sum;
    cin >> T;
    for (int t = 0; t < T; t++){
        input();
        freak_sum = 0;

        int sum;
        for (int i = 0; i < n; i++){
            sum = 0;
            for (int j = 0; j < m; j++){
                sum += like_friend_matrix[i][j];
            }

            if (sum >= (m / 2.0)){
                freak_sum++;
            }
        }

        cout << freak_sum << endl;
    }

    return 0;
}