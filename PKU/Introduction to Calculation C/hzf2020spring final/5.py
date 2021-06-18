s = input()

r = ''

for c in s:
    if c in "abc":
        r += '2'
    elif c in "def":
        r += '3'
    elif c in "ghi":
        r += '4'
    elif c in "jkl":
        r += '5'
    elif c in "mno":
        r += '6'
    elif c in "pqrs":
        r += '7'
    elif c in "tuv":
        r += '8'
    elif c in "wxyz":
        r += '9'
    else:
        r += c

print(r)