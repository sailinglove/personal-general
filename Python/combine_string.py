print('hi')
s1 = input("input s1: ")
s2 = input("input s2: ")
print(s1)
print(s2)
shorter_length = 0
longer_s = ''
if (len(s1) > len(s2)):
    shorter_length = len(s2)
    longer_s = s1
else:
    shorter_length = len(s1)
    longer_s = s2

result_s = ''

for i in range(shorter_length):
    result_s += s1[i] + s2[i]

for i in range(shorter_length, len(longer_s)):
    result_s += longer_s[i]

print(result_s)