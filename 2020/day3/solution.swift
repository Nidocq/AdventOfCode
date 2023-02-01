import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

let input = raw_input
    .split(separator: "\n")

func CountTreesSlope(right: Int, down: Int) -> Int {
    var offset = 0
    var jumps = down-1
    return input
        .compactMap { (line : String.SubSequence) -> Character? in
            if jumps != down-1 {
                jumps += 1
                return nil
            }
            let returnChar = line[line.index(line.startIndex, offsetBy: offset)]
            print(line[line.index(line.startIndex, offsetBy: offset)])

            offset += right
            offset >= line.count ? offset = offset % line.count : ()
            jumps = 0
            return returnChar
        }
        .dropFirst() // The first tile is not counted
        .filter({ $0 == "#" })
        .count
}

//print("Should be 2 = \(CountTreesSlope(right: 1, down: 1))")
//print("Should be 7 = \(CountTreesSlope(right: 3, down: 1))")
//print("Should be 3 = \(CountTreesSlope(right: 5, down: 1))")
//print("Should be 4 = \(CountTreesSlope(right: 7, down: 1))")
//print("Should be 2 = \(CountTreesSlope(right: 1, down: 2))")
let total = CountTreesSlope(right: 1, down: 1)*CountTreesSlope(right: 3, down: 1)*CountTreesSlope(right: 5, down: 1)*CountTreesSlope(right: 7, down: 1)*CountTreesSlope(right: 1, down: 2)

print("Exercise 1 \(CountTreesSlope(right: 3, down: 1))")
print("Exercise 2 \(total)")