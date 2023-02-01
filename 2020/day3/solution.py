import functools
with open("input.txt") as f:
    raw_input = f.readlines()

parsed_list = []
for i in range(len(raw_input)):
    parsed_list.append(raw_input[i].replace("\n", ""))
    
def CountTreeTraversal(right, down) -> int:
    tiles_passed = []
    ite = right

    print(f"parsed list {len(parsed_list[0])}")
    for i in range(0, len(parsed_list), down):
        # We don't want to actually process the first line,
        # we just skip it
        if i == 0:
            continue

        # if the iteration is bigger than the size of the row
        # then match the iteration to simulate the continuation 
        if ite >= len(parsed_list[0]):
            ite = ite % len(parsed_list[0])

        tiles_passed.append(parsed_list[i][ite])
        # Go right steps for next iteration
        ite += right

    # print(tiles_passed)
    return tiles_passed.count("#")

print(f"Exercise 1 : {CountTreeTraversal(3, 1)}")

total = [CountTreeTraversal(1,1) , CountTreeTraversal(3, 1) , CountTreeTraversal(5,1) , CountTreeTraversal(7,1) , CountTreeTraversal(1,2)]

# Times all the numbers together
total = functools.reduce(lambda initi, fold: initi*fold, total)
print(f"Exercise 2 : {total}")