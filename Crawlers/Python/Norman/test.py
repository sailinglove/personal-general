wd = r'Crawlers\Python\Norman\\'

with open(wd + 'FIC.txt', 'r', encoding='UTF-8') as fr:
    payloads = fr.readlines()

payloads = [x.strip() for x in payloads]

print(payloads)