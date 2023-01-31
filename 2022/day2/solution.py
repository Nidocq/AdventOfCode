
# A, X = Rock = 1
# B, Y = Paper = 2
# C, Z = Sciscoors = 3
# !9872, 14426

# X lose
# Y draw
# Z win

X = 1 # rock
Y = 2 # paper
Z = 3 # scis

with open("input.txt", 'r') as f:
    rawInput = f.readlines()

def PickShape(opponent, win_condition):
    if opponent == 'A':                       # rock
        if win_condition == 'X': # lose
            return 0 + Z
        elif win_condition == 'Y': # Draw
            return 3 + X
        elif win_condition == 'Z': # win
            return 6 + Y

    elif opponent == 'B':                     # paper
        if win_condition == 'X': # lose
            return 0 + X
        elif win_condition == 'Y': # Draw
            return 3 + Y
        elif win_condition == 'Z': # win
            return 6 + Z

    elif opponent == 'C':                     # Scis
        if win_condition == 'X': # lose
            return 0 + Y
        elif win_condition == 'Y': # Draw
            return 3 + Z
        elif win_condition == 'Z': # win
            return 6 + X


def battle(opponent, player):
    if opponent == 'A':                       # rock
        if player == 'X':
            # draw with rock == rock
            return 3 + X
        elif player == 'Y':
            # win with rock > paper
            return 6 + Y
        elif player == 'Z':
            # win with rock < sc
            return 0 + Z
    elif opponent == 'B':                     # paper
        if player == 'X':
            # lose rock < paper
            return 0 + X
        elif player == 'Y':
            # dar paper == paper
            return 3 + Y
        elif player == 'Z':
            # win sci > paper
            return 6 + Z
    elif opponent == 'C':                     # Scis
        if player == 'X':
            # win rock > sci
            return 6 + X
        elif player == 'Y':
            # lose sci > paper
            return  0 + Y
        elif player == 'Z':
            # draw sci ?? sci
            return 3 + Z

resultList = []
shapeList = []
for i in range(len(rawInput)):
    choises = rawInput[i].split(" ")
    choises[1] = choises[1].replace("\n", "")

    resultList.append(battle(choises[0], choises[1]))

    shapeList.append(PickShape(choises[0], choises[1]))



print(sum(resultList)) # ex 1
print(sum(shapeList)) # ex 2
