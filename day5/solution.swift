import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./test.txt")
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

let num_sequence = 
    raw_input
        .split(separator: "\n")
        .map{
            // Split each section that is a number into lists
            $0.split(whereSeparator: {!$0.isNumber == true}) 
            .map{ Int($0)! } // make str to num
        }

let parsed_cargo =//: [[Characters]] =
    num_sequence
        .map { MoveCharacters($0, &testCargo) }


// print(num_sequence)
print("parsed cargo : \(parsed_cargo)")
func MoveCharacters(_ instruction : [Int], _ fromList: inout [[Character]]) -> Void {
    // 1 size
    // 2 from
    // 3 to
    // [1, 4, 3]
    print(instruction)

    print("before : \(fromList)")
    var seq = fromList[instruction[1]-1].dropLast(fromList[instruction[1]-1].count-instruction[0])
    fromList[instruction[1]-1].removeSubrange(Range(0...instruction[0]-1))
    print("coundt :" )
    print(fromList.count)
    print("sequence dropped : \(seq)")
    print("range deleted : \(Range(0...instruction[0]-1))")

    // Prepend the list to the array. seq is reversed because they put it back
    // 1 after 1
    fromList[instruction[2]-1].insert(contentsOf: seq.reversed(), at: 0)
    print("Parsed : \(fromList)")
        
}

