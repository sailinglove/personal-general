num = []
for i in range(5):
    num.append(int(input()))

max1 = max(num)
num.remove(max1)
max2 = max(num)
print("max {}".format(max1 * max2))

num.append(max1)

min1 = min(num)
num.remove(min1)
min2 = min(num)
print("min {}".format(min1 * min2))