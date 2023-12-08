with open("input.txt", "r") as f:
    data = "".join(f.readlines()).split("\n\n")
    command = data[0]

def MakeDictionary(d:list[str]) -> dict:
    dic = dict()
    for row in "".join(d[1:]).split("\n"):
        delim = row.split(" = ")
        # [1:-1] removes the ( and )
        twoInstructions = delim[1][1:-1].split(", ")
        dic[delim[0]] = (twoInstructions[0], twoInstructions[1])

    return dic

def traverse(startInstruction: str, instructionSet: dict, command: str, type="all") -> int:
    index = 0
    counter = 0
    currentInstruction = startInstruction
    while True:
        if type=="last" and currentInstruction[-1] == "Z":
            break
        elif type=="all" and currentInstruction == "ZZZ":
            break
        if index == len(command):
            index = 0

        if command[index] == "R":
            currentInstruction = instructionSet[currentInstruction][1]
        else:
            currentInstruction = instructionSet[currentInstruction][0]

        counter += 1
        index += 1

    return counter
    #elif type == "startingWith":
    #    # Doing 50 million traversalsthe traditiona way is just too slow.
    #    # We will use Memoization
    #    memoTable = dict()

    #    # Gets all the instructions that ends with A
    #    currentInstruction = list(filter(lambda x: x[-1] == "A", instructionSet.keys()))
    #    # Check if all the currentInstructions ends with Z. if they do break while
    #    while not all(inst[-1] == "Z" for inst in currentInstruction):
    #        if index == len(command):
    #            index = 0

    #        currentInstruction = list(map(lambda x: instructionSet[x][1] if command[index] == "R" else instructionSet[x][0], currentInstruction))

    #        counter += 1
    #        index += 1
    #    return counter


myDict = MakeDictionary(data)
print(f' Exercise 1 : traversals: {traverse("AAA", myDict, command)}')

# find instructions ending with A -> ['QXA', 'PDA', 'TDA', 'QQA', 'PPA', 'AAA']
instEndingA = list(filter(lambda x: x[-1] == "A", myDict.keys()))

# find the traversal count of all the instructions ending with A
traversalsEach = list(map(lambda x: traverse(x, myDict, command, "last"), instEndingA))

from math import lcm
# Had to look at a little hint on the internet - Take the
# Least common multiple of all the traversals
print(f' Exercise 2 : traversals: {lcm(*traversalsEach)}')
