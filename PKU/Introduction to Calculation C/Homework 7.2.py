factor = (7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2) # 每位所對應的系數
last = ("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2")

while True:
    id = input("請輸入身份證號，0則退出")
    if id == "0":
        break
    if len(id) != 18:
        print("重新輸入")
        continue
    else:
        # 從這裡開始是要看身份證號是不是合法
        # 要先算身份證號每個位乘以一個系數之後的和
        sum = 0 # 先設和為0方便等下累加
        for i in range(17): # 遍歷每一個位
            # 重點來啦
            # sum = sum + ... 把新的結果累加到自己身上
            # int(id[i]) 把當前位從字符串變成整數類型
            # * factor[i] 乘上第i位所對應的系數
            sum = sum + int(id[i]) * factor[i]
        m = sum % 11 # 把和對11取模，就是 sum 除以 11 的餘數
        lastchat = id[17] # 最後一位
        lastchar = lastchat.upper() # 可能是x，變成大寫方便比較
        # 重點來啦
        # 身份證號最後一位是“校驗碼”（HKID也有的）
        # 把之前算到的模（餘數）對應成相應的數字/X，如果一樣的話就是合法的
        if lastchar == last[m]:
            print(id, "為合法身份證號，", end="")
            # 怎麼看單/雙數？看數字除以2之後餘數等不等於0鴨
            if int(id[16]) % 2 == 0:
                print("為女性")
            else:
                print("為男性")
        else:
            print("重新輸入")