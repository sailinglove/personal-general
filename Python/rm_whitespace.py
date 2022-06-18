import re

# with open(r'D:\Documents\Github\sailinglove\personal-general\Python\a.txt', 'r') as fr:
#     s_list = fr.readlines()
#     s = "".join(s_list)

s = input("Please input the text you would like to remove whitespaces from:")

s = re.sub('\s+', '', s).strip()

# if (input("remove line break?") == 'y'):
#     s.replace('\n', '')

# with open('b.txt', 'w') as fw:
#     fw.write(s)

print(s)