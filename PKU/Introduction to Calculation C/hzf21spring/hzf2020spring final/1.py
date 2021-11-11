p = int(input())
q = int(input())

for i in range(1, 101):
    if i % p == q:
        print(i)