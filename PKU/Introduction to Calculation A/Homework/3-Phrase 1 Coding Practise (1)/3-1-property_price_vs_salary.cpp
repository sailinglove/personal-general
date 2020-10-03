#include <iostream>
using namespace std;

int main(){
    float salary = 0, price = 0, savings = 0;
    int i = 1;
    cin >> salary;
    cin >> price;

    for (; i <= 100; i++) {
        savings += salary;
        if (savings >= price) {
            break;
        }
        salary *= 1.08;
        price *= 1.1;
    }

    if (savings >= price){
        cout << i;
    } else {
        cout << "Forget it.";
    }
    return 0;
}