n = int(input())
for i in range(10**(n-1), 10**n):
    s = 0
    for j in str(i):
        s = s + int(j)**n
    if s == i:
        print(i)