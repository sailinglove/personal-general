#include<iostream>
#include<stdio.h>
using namespace std;

int main() {
    int staffsReceipt[4] = {0};
    float receiptValue[4][101] = {0};
    char receiptCat[4][101] = {' '};

    int ID = 0;
    for (int i = 1; i <= 3; i++) {
        cin >> ID;
        cin >> staffsReceipt[ID];
        for (int j = 0; j < staffsReceipt[ID]; j++) {
            cin >> receiptCat[ID][j] >> receiptValue[ID][j];
        }
    }
    
    float sum;
    for (int i = 1; i <= 3; i++) {
        sum = 0;
        cout << i << ' ';
        for (int j = 0; j < staffsReceipt[i]; j++) {
            sum += receiptValue[i][j];
        }
        printf("%.2f\n", sum);
    }

    float sumA = 0, sumB = 0, sumC = 0;
    for (int i = 1; i <= 3; i++) {
        for (int j = 0; j < staffsReceipt[i]; j++) {
            switch (receiptCat[i][j]) {
            case 'A':
                sumA += receiptValue[i][j];
                break;
            case 'B':
                sumB += receiptValue[i][j];
                break;
            case 'C':
                sumC += receiptValue[i][j];
            }
        }
    }
    printf("A %.2f\nB %.2f\nC %.2f\n", sumA, sumB, sumC);

    return 0;
}