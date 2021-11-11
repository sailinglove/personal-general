import os
import random

# with open('score.txt', 'w', encoding='utf-8') as f:
#     f.write("學號\t平時成績\t期末成績\n")
#     for i in range(200):
#         f.write("2000014" + str(i).zfill(3) + "\t" + str(random.randint(50, \
#             100)) + "\t" + str(random.randint(50, 100)) + "\n")

students = list(open('score.txt'))
del students[0]
sum = 0
counts = [0, 0, 0, 0, 0]
totals = {}
for s in students:
    student = s.split()
    total = int(student[1])*0.4 + int(student[2])*0.6
    sum += total
    totals[student[0]] = total
    if total >= 90:
        counts[0] += 1
    elif total >= 80:
        counts[1] += 1
    elif total >= 70:
        counts[2] += 1
    elif total >= 60:
        counts[3] += 1
    else:
        counts[4] += 1

sortedTotals = sorted(totals.items(), key=lambda item:item[1], reverse=True)
with open('scored.txt', 'w', encoding='utf-8') as f:
    f.write("學號\t總評成績\n")
    for student in sortedTotals:
        # f.write(str(student[0]) + '\t' + str(student[1]) + '\n')
        f.write('{}\t{:.2f}\n'.format(student[0], student[1]))
print('90分以上：', counts[0])
print('80~89分：', counts[1])
print('70~79分：', counts[2])
print('60~69分：', counts[3])
print('60分以下：', counts[4])
print('班級總平均分：{:.2f}'.format(sum/200))