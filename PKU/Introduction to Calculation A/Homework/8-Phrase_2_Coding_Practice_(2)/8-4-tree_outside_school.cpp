#include<iostream>
using namespace std;

int road[10001] = {-999};

void treeRemove(int startingPoint, int endingPoint) {
    for (int i = startingPoint; i <= endingPoint; i++) {
        road[i] = 0;
    }
}

int main() {
    int L = 0, M = 0;
    cin >> L >> M;

    for (int i = 0; i <= L; i++) {
        road[i] = 1;
    }

    int s = 0, e = 0;
    for (int i = 0; i < M; i++) {
        cin >> s >> e;
        treeRemove(s, e);
    }

    int count = 0;
    for (int i = 0; i <= L; i++) {
        if (road[i] == 1) {
            count++;
        }
    }

    cout << count << endl;

    return 0;
}