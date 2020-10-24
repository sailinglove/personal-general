#include<iostream>
#include<string>
#include<cmath>
using namespace std;

string baseConverter(int num, int targetBase) {
    int tempTargetNum[3] = {0}, temp = num;
    for (int i = 2; i >= 0; i--) {
        tempTargetNum[i] = temp / pow(targetBase, i*1.0);
        temp %= (int)pow(targetBase, i*1.0);
    }
    string targetNum = "";
    for (int i = 2; i >= 0; i--) {
        targetNum.append(string(1, (char)(tempTargetNum[i] + 48)));
    }

    return targetNum;
}

int special_num() {
    int theNum = 0;
    string heptal = "", nonal = "";
    bool flag = false;
    for (int i = 81; i < 343; i++) {
        heptal = baseConverter(i, 7);
        nonal = baseConverter(i, 9);
        flag = true;
        for (int j = 2; j >= 0; j--) {
            if (heptal[j] != nonal[2-j]) {
                flag = false;
                break;
            }
        }
        if (flag) {
            theNum = i;
            break;
        }
    }

    return theNum;
}

int main() {
    int n = 0, sNum = special_num();
    cin >> n;
    switch (n){
    case 1:
        cout << sNum;
        break;
    case 2:
        cout << baseConverter(sNum, 7);
        break;
    case 3:
        cout << baseConverter(sNum, 9);
        break;
    }
    cout << endl;

    return 0;
}