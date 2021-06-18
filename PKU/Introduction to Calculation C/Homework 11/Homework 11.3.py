# x, y, z 三人分別對應ASCII碼 120, 121, 122

flag = False

for a in range(120, 123):
    for b in range(120, 123):
        if b == a:
            continue
        for c in range(120, 123):
            if c == b or c == a:
                continue
            if (a != 120) and ((c != 120) and (c != 122)):
                flag = True
                break
        if flag:
            break
    if flag:
        break

print('a vs {}\nb vs {}\nc vs {}'.format(chr(a), chr(b), chr(c)))