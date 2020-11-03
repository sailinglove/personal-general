// #include<iostream>
// using namespace std;

// #define openingHours 120

// int n = 0;
// int patients[21] = {0};

// void swap(int &a, int &b)
// {
//     int temp = a;
//     a = b;
//     b = temp;
// }

// void sort()
// {
//     bool flag = false;
//     for (int i = 0; i < n - 1; i++)
//         for (int i = 0; i < n - 1; i++)
//             if (patients[i] > patients[i + 1])
//                 swap(patients[i], patients[i + 1]);
// }

// int main()
// {
//     int time = 0, count = 0;
//     cin >> n;
//     for (int i = 0; i < n; i++)
//         cin >> patients[i];
//     sort();
//     do
//     {
//         for (int i = 0; i < n; i++)
//         {
//             if (patients[i] <= (time + 60))
//                     time += 10;
//                 else
//                     time += patients[i] - (time + 60) + 10;
//             if ((time <= openingHours))
//                 count++;
//             else
//                 break;
//         }
//     } while (time <= openingHours);

//     cout << count;

//     return 0;
// }

#include<iostream>
using namespace std;

#define MAX_N 100
#define MAX_TIME 180
#define START_TIME 60
#define TIME_PER_PATIENT 10

int main()
{
	int n = 0;
	int arrival[MAX_N] = {0};
	int num = 0;

	cin >> n;
	for (int i = 0; i < n; i++)
		cin >> arrival[i];

	for (int a = 0; a < n - 1; a++)
		for (int b = a + 1; b < n; b++)
			if (arrival[a] > arrival[b])
			{
				arrival[a] = arrival[a] ^ arrival[b];
				arrival[b] = arrival[a] ^ arrival[b];
				arrival[a] = arrival[a] ^ arrival[b];
			}

    for (int i = 0, t = START_TIME; t <= MAX_TIME - TIME_PER_PATIENT && num < n; t++)
		if (t >= arrival[num])
		{
			num++;
			t += TIME_PER_PATIENT - 1;
		}
		else
			t++;
	cout << num;
	return 0;
}