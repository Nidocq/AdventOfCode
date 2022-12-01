
class Elf:
    def __init__(self):
        self.calories = 0

    def CaloriesCount(self, intake):
        for i in intake:
            self.calories += int(i)

with open("input.txt") as file:
    rawInput = file.readlines()


# Chunking each elfs' list of calories into a big list
CaloriesList = []
checkpoint = 0
for i in range(len(rawInput)):
    if rawInput[i] == "\n":
        CaloriesList.append(rawInput[checkpoint:i])
        checkpoint = i

# Pruning the elfList
for elfList in range(len(CaloriesList)):
    for i in range(len(CaloriesList[elfList])):
        CaloriesList[elfList][i] = CaloriesList[elfList][i].replace('\n', '')
    del CaloriesList[elfList][0]

# Make elfs with calories
ElfList = []

# Append an elf with their list
for i in range(len(CaloriesList)):
    e = Elf()
    e.CaloriesCount(CaloriesList[i])
    ElfList.append(e)


# Finding the max of the elfs
ElfCaloriesList = [e.calories for e in ElfList]
print(f"Max calories are : {max( ElfCaloriesList )}")

# Finding the three most calories from elf
print(f"Three highest elves' calories combied { sum(( sorted(ElfCaloriesList)[-3:] ) ) } ")