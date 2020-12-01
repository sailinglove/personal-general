#include <iostream>
#include <string>
using namespace std;

int countSuccessiveChar(string s, int targetPos) {
    int i = targetPos + 1;
    int len = 1;
    while (s[i] == s[targetPos]) {
        len++;
        i++;
    }
    return len;
}

int main() {
    int k = 0;
    cin >> k;

    string str = "";
    int num = 0;

    for (int i = 0; i < k; i++) {
        cin >> str;
        for (int j = 0; j < str.length(); j++) {
            num = countSuccessiveChar(str, j);
            cout << num << str[j];
            j += num - 1;
        }
        cout << endl;
    }
}