n = input().split()

def whetheri(n):
    for i in n:
        if i.find('.') == -1:
            pass
        else:
            return False
    return True

if whetheri(n):
    print(int(n[0]) * int(n[1]))
else:
    print('%.2f' % (float(n[0]) + float(n[1])))
