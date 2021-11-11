text1 = list(open('text1'))
text2 = list(open('text2'))
print(text1, text2)
with open('new', 'w') as f:
    for line in text2:
        if line in text1:
            f.write(line)