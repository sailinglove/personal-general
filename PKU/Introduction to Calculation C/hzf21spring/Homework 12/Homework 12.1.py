import re

cEmail = re.compile('[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,10}.(com|org)', re.I)
mEmail = input("請輸入待匹配的email地址：")
m = cEmail.match(mEmail)
if m:
    print(mEmail, "符合規則")
else:
    print(mEmail, "不符合規則")

sEmail = input("請輸入待搜索email地址的字符串：")
m = cEmail.search(sEmail)
if m:
    print("字符串中有email地址：", m.group(0))
else:
    print("字符串中沒有email地址")


cIPv4 = re.compile('\d{1,3}(\.\d{1,3}){3}')
mIPv4 = input("請輸入待匹配的IPv4地址：")
m = cIPv4.match(mIPv4)
if m:
    print(mIPv4, "符合規則")
else:
    print(mIPv4, "不符合規則")

sIPv4 = input("請輸入待搜索IPv4地址的字符串：")
m = cIPv4.search(sIPv4)
if m:
    print("字符串中有IPv4地址：", m.group(0))
else:
    print("字符串中沒有IPv4地址")
    

ctele = re.compile('[1-9]\d{2}([ -]?\d{4}){2}')
mtele = input("請輸入待匹配的電話號碼：")
m = ctele.match(mtele)
if m:
    print(mtele, "符合規則")
else:
    print(mtele, "不符合規則")

stele = input("請輸入待搜索電話號碼的字符串：")
m = ctele.search(stele)
if m:
    print("字符串中有電話號碼：", m.group(0))
else:
    print("字符串中沒有電話號碼")


cID = re.compile('[1-9]\d{16}[1-9Xx]')
mID = input("請輸入待匹配的身份證號：")
m = cID.match(mID)
if m:
    print(mID, "符合規則")
else:
    print(mID, "不符合規則")

sID = input("請輸入待搜索身份證號的字符串：")
m = cID.search(sID)
if m:
    print("字符串中有身份證號：", m.group(0))
else:
    print("字符串中沒有身份證號")