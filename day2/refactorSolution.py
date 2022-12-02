# with a bit of inspiration from
# https://github.com/athas/aoc22/blob/main/2.fut

with open("input.txt", 'r') as f:
    rawInput = f.readlines()


# A, X = Rock = 1
# B, Y = Paper = 2
# C, Z = Sciscoors = 3

def shape_sig(x):
    match x:
        case 'X':
            return 1
        case 'Y':
            return 2
        case 'Z':
            return 3

score = 2
def mathing(lst):
    shape = shape_sig(lst[1])
    match lst:
        case ['A', 'X']: 3 + shape
        case ['A', 'Y']:
            return 6 + shape
        case ['A', 'Z']:
            return 0 + shape
        case ['B', 'X']:
            return 0 + shape
        case ['B', 'Y']:
            return 3 + shape
        case ['B', 'Z']:
            return 6 + shape 
        case ['C', 'X']:
            return 6 + shape
        case ['C', 'Y']:
            return 0 + shape
        case ['C', 'Z']:
            return 3 + shape


resultList = []
shapeList = []
for i in range(len(rawInput)):
    choises = rawInput[i].split(" ")
    choises[1] = choises[1].replace("\n", "")
    resultList.append(mathing(choises))
    print(rawInput[i], end='')

print(sum(resultList))
