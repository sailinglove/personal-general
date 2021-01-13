#include <iostream>
using namespace std;

//global variables

int get_len(char str[301]){
    int length = 0;
    for (int i = 0; str[i] != 0; i++)
        length++;
    
    return length;
}

int locate(char target_s[11], char base_str[301], int tar_str_len, 
           int base_str_len){
    int left_ptr = 0;
    bool flag = false;

    for (int i = 0; i < base_str_len; i++){
        if (base_str[i] == target_s[0]){
            flag = true;
            for (int j = 1; j < tar_str_len; j++){
                if (base_str[i+j] != target_s[j]){
                    flag = false;
                    break;
                }
            }
            if (flag)
                break;
        }
    }

    if (flag)
        return left_ptr;
    else
        return -999;
}

int main() {
    char S[301] = {0}, S1[11] = {0}, S2[11] = {0};

    cin.getline(S, 300, ',');
    cin.getline(S1, 10, ',');
    cin.getline(S2, 10);

    int S_len = get_len(S);
    int S1_len = get_len(S1);
    int S2_len = get_len(S2);

    int S1_pos = locate(S1, S, S1_len, S_len);

    cout << S1_pos;

    return 0;
}