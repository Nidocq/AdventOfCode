with open('input.txt', 'r') as f:
    data = [i.replace("\n", "") for i in f.readlines()]


# Split the lines into only the winning numbers and the drawn numbers as tuple
def getNumbers(lines) -> list[(list[int], list[int])]:
    nums = []
    for i in lines:
        lists = "".join(i.split(':')[1]).split('|')
        fst = list(filter(None, lists[0].strip().split(' ')))
        snd = list(filter(None, lists[1].strip().split(' ')))
        nums.append((fst, snd))
    return nums


l = getNumbers(data)
total = 0
# 1 will only appear once
lotteries = []
for i in range(len(l)):
    # Find length of all the common numbers of first and second tuple value
    lengthOfCommons = len(list(set(l[i][0]).intersection(set(l[i][1]))))

    # Read the amount of numbers that we are currently on to prevent double 
    # counting
    numLotterTickets = lotteries.count(i+1)

    lotteries += [i+1]  # original ticket
    for _ in range(numLotterTickets+1):  # duplicate tickets:
        # +1 because it's 0 indexed, another +1 because we don't want the
        # current lottery number to be within the winning lotteries
        lotteries += list(range(i+1+1, i+lengthOfCommons+1+1))

    if lengthOfCommons != 0:
        total += 2**(lengthOfCommons-1)

print(f'Exercise 1 : {total}')
print(f'Exercise 2: {len(lotteries)}')
