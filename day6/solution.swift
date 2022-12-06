import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

let exerciseOne =
    raw_input
        .reduce("") { x, y in
            var tmp = x
            // print(tmp)
            if tmp.count > 14 {
                // print("removing")
                tmp.removeFirst()
                // print("tmp after remove : \(tmp)")
            }
            let length = tmp.count
            if tmp.count == 14 {
                // All characters are unique
                if Set(tmp).count ==  length {
                    // let kk = raw_input.components(separatedBy: tmp)
                    return tmp
                }
            }
            return tmp + String(y)
        }



// let exerciseTwo =
    // raw_input
print(raw_input[raw_input.startIndex..<raw_input.range(of: exerciseOne)!.upperBound].count)