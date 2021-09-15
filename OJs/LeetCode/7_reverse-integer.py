x = int(input())

if x < 0:
    x = str(x)[1:]
    x = x[::-1]
    x = int('-' + x)
    if x < -2**31:
        print(0)
    print(x)
elif x == 0:
    print(0)
elif x > 0:
    x = int(str(x)[::-1])
    if x > 2**31-1:
        print(0)
    print(x)