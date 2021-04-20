d = {}
n = int(input())
for i in range(n):
    temp = input()
    if temp in d:
        d[temp] += 1
    else:
        d[temp] = 1

sortedD = sorted(d.items(), key=lambda item:item[1])
for pair in sortedD:
    print('{} {}'.format(pair[0], pair[1]))