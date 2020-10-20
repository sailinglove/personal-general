#include<iostream>
#include<string>
using namespace std;

int main() {
    string str = "";
    // cin >> str;
    getline(cin, str);
    int len = str.size();
    int upperCount = 0, lowerCount = 0, numCount = 0;
    for (int i = 0; i < len; i++) {
        int n = str[i];
        if ((n >= 65) && (n <= 90))
            upperCount++;
        else if ((n >= 97) && (n <= 122))
            lowerCount++;
        else if ((n >= 48) && (n <= 57)) 
            numCount++;
    }
    cout << upperCount << ' ' << lowerCount << ' ' << numCount << endl;

    return 0;
}