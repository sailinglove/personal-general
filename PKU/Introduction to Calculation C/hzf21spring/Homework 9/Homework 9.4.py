import random
print('hello')
s = input('請輸入你的名字：')
print(s + '，你好')

rnum = random.randint(1,100)

count = 0
while True:
    try:
        guess = int(input('請猜數0-100之間的整數：'))
        if guess < 0 or guess > 100:
            raise ValueError
    except ValueError:
        print('必須輸入一個0-100的整數')
    else:
        if guess > rnum:
            print('太大')
        elif guess < rnum:
            print('太小')
        else:
            print('恭喜答對了')
            break
        count += 1
    if count > 6:
        print('抱歉，機會用完了')
        break