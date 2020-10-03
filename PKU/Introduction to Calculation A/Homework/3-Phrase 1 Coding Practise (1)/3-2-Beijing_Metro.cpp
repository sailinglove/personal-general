#include<iostream>
#include<iomanip>
#include<math.h>
using namespace std;

int main(){
    int p_expense = 0, mileage = 0;
    float price = 0;
    cin >> p_expense >> mileage;

    if (mileage > 0){
        if (mileage <= 6){
            price += 3;
        } else {
            price += 4;
            if ((mileage > 12) && (mileage <= 32)){
                price += ceil(1.0*(mileage - 12) / 10);
            } else if (mileage > 32){
                price += 2;
                price += ceil(1.0*(mileage - 32) / 20);
            }
        }
    }

    if ((p_expense >= 100) && (p_expense < 400)){
        if (p_expense >= 150){
            price *= 0.5;
        } else {
            price *= 0.8;
        }
    }

    cout << setiosflags(ios::fixed) << setprecision(2) << price << endl;
}