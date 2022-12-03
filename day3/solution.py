# Depricated
with open("test.txt", "r") as f:
    rawInput = f.readlines() 
# 1583

def Priority(letter):
    if letter.islower():
        return ord(letter)-96
    if letter.isupper():
        return ord(letter)-38

#print(Priority("Z"))
sumlist = []
for ruck in range(len(rawInput)):
    # Cleaning data
    rawInput[ruck] = rawInput[ruck].replace("\n", "")

    print(f"first half : {rawInput[ruck][:len(rawInput[ruck])/2]}")
    print(f"second half : {rawInput[ruck][len(rawInput[ruck])/2:]}")
    sum = 0
    for letter in rawInput[ruck]:
        sum += Priority(letter)
    sumlist.append(sum)


print(max(sumlist))
