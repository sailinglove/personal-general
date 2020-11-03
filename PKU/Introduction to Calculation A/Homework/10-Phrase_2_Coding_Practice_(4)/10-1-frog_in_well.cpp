#include<iostream>
using namespace std;

int main()
{
    int H = 0, U = 0, D = 0, frog_pos = 0, count = 0;
    cin >> H >> U >> D;

    while (frog_pos < H)
    {
        count++;
        frog_pos += U;
        if (frog_pos >= H)
            break;
        frog_pos -= D;
    }
    cout << count << endl;

    return 0;
}