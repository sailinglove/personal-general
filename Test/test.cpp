#include <iostream>
using namespace std;

int partition(int* arr, int LP, int RP) {
    int k = arr[LP];
    do {
        while ((LP < RP) && (arr[RP] >= k)) {
            RP--;
        }
        if (LP < RP) {
            arr[LP] = arr[RP];
            LP++;
        }
        
        while ((LP < RP) && (arr[LP] <= k)) {
            LP++;
        }
        if (LP < RP) {
            arr[RP] = arr[LP];
            RP--;
        }
    } while (LP != RP);
    arr[LP] = k;
    return k;
}

void qsort(int* arr, int LP, int RP) {
    int k = partition(arr, LP, RP);
    qsort(arr, LP, k-1);
    qsort(arr, k+1, RP);
}

int main() {
    int array[10] = {5, 4, 7, 9, 2, 6, 0, 1, 3, 8};
    qsort(array, 0, 9);
    cout << array;
}