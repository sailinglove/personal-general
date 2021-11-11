stuff = {'rope':1, 'torch':6, 'gold coin':42, 'dagger':1, 'arrow':12}
sum = 0

for item in stuff:
    print(stuff[item], item)
    sum += stuff[item]
print('Total number of items:{}'.format(sum))