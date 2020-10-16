// #include<iostream>
// #include<cmath>
// using namespace std;

// bool check_angle(double x1, double y1, double x2, double y2)
// {
//     return (x1*x2 + y1*y2) / (sqrt(x1*x1 + y1*y1) * sqrt(x2*x2 + y2*y2)) > -0.5;
// }


// bool cut_or_not(int x1, int y1, int x2, int y2, int x3, int y3) {
    
//     double p1_p2 = distance_formula(x1, y1, x2, y2), p2_p3 = distance_formula(x2, y2, x3, y3),
//            p1_p3 = distance_formula(x1, y1, x3, y3), 
//            O_p1 = distance_formula(0, 0, x1, y1), O_p2 = distance_formula(0, 0, x2, y2),
//            O_p3 = distance_formula(0, 0, x3, y3);
//     //                 1_2                                2_3                                1_3
//     double angle[3] = {cosine_formula(p1_p2, O_p1, O_p2), cosine_formula(p2_p3, O_p2, O_p3), cosine_formula(p1_p3, O_p1, O_p3)};
//     bool flag = true;
//     for (int i = 0; i < 3; i++) {
//         if (angle[i] > (-0.5)) {
//             flag = false;
//         }
//     }
//     return flag;
// }

// int main() {
//     int t = 0;
//     cin >> t;
//     for (int i = 0; i < t; i++) {
//         int r = 0, x1 = 0, y1 = 0, x2 = 0, y2 = 0, x3 = 0, y3 = 0;
//         cin >> r >> x1 >> y1 >> x2 >> y2 >> x3 >> y3;
//         if (cut_or_not(x1, y1, x2, y2, x3, y3)) {
//             cout << "Yes";
//         } else {
//             cout << "No";
//         }
//         cout << endl;
//     }
// }

#include<iostream>;
#include<cmath>;
using namespace std;

#define MAX_N 10

bool check_angle(double x1, double y1, double x2, double y2)
{
    return (x1*x2 + y1*y2) / (sqrt(x1*x1 + y1*y1) * sqrt(x2*x2 + y2*y2)) > -0.5;
}

bool check_outside(double r, double x, double y)
{
    return sqrt(x*x + y*y) > r;
}

bool check_center(double x, double y)
{
    return x*x + y*y == 0;
}

int main()
{
	int t;
	cin >> t;
	for(int case_ = 0; case_ < t; case_++)
    {
        double r, x[MAX_N], y[MAX_N];
        int n = 3;
        bool flag = false, flag2 = true;
		cin >> r;
		for (int i = 0; i < n; i++)
            cin >> x[i] >> y[i];
        for (int i = 0; i < n; i++)
        {
            int j = (i + 1) % n;
            if (flag2 && !check_angle(x[i], y[i], x[j], y[j]))
                flag2 = false;
            if (check_outside(r, x[i], y[i]) || check_center(x[i], y[i]))
            {
                flag = true;
                break;
            }
        }
        flag |= flag2;
        if (flag)
            cout << "No" << endl;
        else
            cout << "Yes" << endl;
    }
	return 0;
}