import random

with open("number.txt", "w") as f:
    for i in range(10):
        temp = random.randint(100, 999)
        print(temp)
        if (temp % 100 // 10) % 2 == 0:
            f.write(str(temp) + "\n")