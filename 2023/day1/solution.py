import re
with open('test.txt', 'r') as f:
    data = f.readlines()

names = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
regexString = "|".join(names)


def transformWord(raw):
    namesDict = {"one":1, "two":2, "three":3, "four":4, "five":5, "six":6, "seven":7, "eight":8, "nine":9}
    for line in range(len(raw)):
        ex = re.findall(regexString, raw[line])
        for replacement in ex:
            raw[line] = raw[line].replace(replacement, str(namesDict[replacement]))
    return raw


def sumFirstSecond(raw):
    n = []
    for i in range(len(raw)):
        n.append(re.findall("\d", raw[i]))

    print(f'n {n}')
    s = []
    for i in n:
        first = i[0]
        second = i[-1]
        s.append(int(str(first) + str(second)))
    print(s)
    return sum(s)


#print(transformWord(data))
#print(f'exercise 1 {sumFirstSecond(data)}')
print(f'exercise 2 {sumFirstSecond(transformWord(data))}')


# low 55990
