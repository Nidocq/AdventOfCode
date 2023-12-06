with open("test.txt", 'r') as f:
    data = f.readlines()


print(data)

for i in data:
    print(i.split(""))
