b = input()

length = len(b)

d = 0

for i in range(length):
    d += int(b[length-1-i]) * pow(2, i)

print(d)