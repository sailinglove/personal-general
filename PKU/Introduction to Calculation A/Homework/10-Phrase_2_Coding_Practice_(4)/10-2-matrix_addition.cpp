#include<iostream>
using namespace std;

int main()
{
    int n = 0;
    cin >> n;
    int a[100][100] = {0}, b[100][100] = {0}, c[100][100] = {0};
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cin >> a[i][j];
        }
    }
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            cin >> b[i][j];
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            c[i][j] = a[i][j] + b[i][j];
            if (j == 0)
                cout << c[i][j];
            else
                cout << " " << c[i][j];
        }
        cout << endl;
    }

    return 0;
}