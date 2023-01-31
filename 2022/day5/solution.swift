import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

var cargo : [[Character]] = [
["T",  "Q",  "V",  "C",  "D", "S",  "N"],
["V", "F", "M"],
["M", "H", "N", "P", "D", "W",  "Q",  "F"],
["F", "T", "R","Q","D"],
["B", "V", "H", "Q", "N","M","F", "R"],
["Q", "W", "P", "N", "G", "F", "C"],
["T","C", "L", "R", "F", "W"],
["S","N", "Z", "T"],
["N", "H",     "Q",     "R",     "J",     "D",     "S",     "M" ]
]
var testCargo : [[Character]] = [
["N", "Z"],
["D", "C", "M"],
["P"]
]

let Characters = //: [[Character]] = 
    raw_input
        .split(separator: "\n")
        .map{
            // Split each section that is a number into lists
            $0.split(whereSeparator: {!$0.isNumber == true}) 
            .map{ Int($0)! } // make str to num
        }
        // Fold function with moveCharacters
        .reduce(cargo, MoveCharacters)
        .reduce("") { x,y in
            x + String(y[0])
        }


func MoveCharacters(_ fromList: [[Character]], _ instruction : [Int]) -> [[Character]] {
    // instruction set 1 size, 2 from 3 to
    // [1, 4, 3]

    var imList = fromList
    let seq = imList[instruction[1]-1].dropLast(imList[instruction[1]-1].count-instruction[0])
    imList[instruction[1]-1].removeSubrange(Range(0...instruction[0]-1))
    // Prepend the list to the array. seq is reversed because they put it back
    // 1 after 1
    // Exercise 2 just uses seq instead of seq.reversed()
    imList[instruction[2]-1].insert(contentsOf: seq.reversed(), at: 0)
    return imList
}

print(Characters)