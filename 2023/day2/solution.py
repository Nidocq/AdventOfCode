import functools
with open("input.txt", 'r') as f:
    data = [i.replace("\n", "") for i in f.readlines()]


def makeDict(raw) -> dict:
    gameDicts = dict()
    for line in range(len(raw)):
        lst = []
        g = raw[line].split(":")
        game = g[0]
        iterations = g[1]

        for iteration in iterations.split(";"):
            draws = iteration.split(",")
            d = dict()
            for draw in draws:
                combi = draw.strip().split(" ")
                d[combi[1]] = combi[0]

            lst.append(d)
        gameDicts[line] = lst
    return gameDicts


data = makeDict(data)
impGameIDs = []
for i in range(len(data)):
    for j in data[i]:
        for color in ["red", "blue", "green"]:
            try:
                if color == "red":
                    if int(j[color]) > 12:
                        # +1 because the line is 0 indexed
                        impGameIDs.append(int(i+1))
                elif color == "blue":
                    if int(j[color]) > 14:
                        impGameIDs.append(int(i+1))
                elif color == "green":
                    if int(j[color]) > 13:
                        impGameIDs.append(int(i+1))

            except Exception:
                # if the color does not exist in the dict
                continue
            pass

# take the difference of full set and the impossible games
l = list(set(range(1, len(data)+1)).difference(set(impGameIDs)))
print(f'Exercise 1 : {sum(l)}')

powers = []
for i in range(len(data)):
    maxRBG = dict({"red": 0, "green": 0, "blue": 0})
    for color in ["red", "blue", "green"]:
        for iteration in data[i]:
            try:
                if int(iteration[color]) > maxRBG[color]:
                    maxRBG[color] = int(iteration[color])
            except Exception:
                pass

    powers.append(functools.reduce(lambda x, y: int(x)*int(y) ,maxRBG.values()))

print(f'Exercise 2 : {sum(powers)}')
