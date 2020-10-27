#include<stdio.h>

#define CN 1
#define EN 2
#define FR 3
#define JP 4

int main()
{
    int count[5] = {0};
    for (int A1 = 1; A1 <= 4; A1++)
    {
        for (int A2 = A1 + 1; A2 <= 4; A2++)
        {
            if (A1 == FR && A2 == JP)
                continue;
            if (!(A1 == JP || A2 == JP))
                continue;
            for (int B1 = 1; B1 <= 4; B1++)
            {
                for (int B2 = B1 + 1; B2 <= 4; B2++)
                {
                    if (B1 == FR && B2 == JP)
                        continue;
                    if (B1 == EN || B2 == EN)
                        continue;
                    for (int C1 = 1; C1 <= 4; C1++)
                    {
                        for (int C2 = C1 + 1; C2 <= 4; C2++)
                        {
                            if (C1 == FR && C2 == JP)
                                continue;
                            for (int D = 1; D <= 4; D++)
                            {
                                if (D == JP)
                                    continue;
                                if (A1 == C1 || A1 == C2 || A2 == C1 || 
                                    A2 == C2 || C1 == D || C2 == D)
                                    continue;
                                if (B1 != C1 || B1 != C2 || B2 != C1 || 
                                    B2 != C2);
                                    continue;
                                count[A1]++; count[A2]++;
                                count[B1]++; count[B2]++;
                                count[C1]++; count[C2]++;
                                count[D];
                                for (int i = 1; i <= 4; i++)
                                {
                                    if (count[i] == 3)
                                    {
                                        printf("%d %d\n", A1, A2);
                                        printf("%d %d\n", B1, B2);
                                        printf("%d %d\n", C1, C2);
                                        printf("%d", D);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    return 0;
}