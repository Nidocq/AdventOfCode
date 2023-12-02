import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

let input = raw_input
    .components(separatedBy: "\n\n")
    .map { (str : String) -> String in
        str.replacingOccurrences(of: "\n", with: " ")
    }
    .map { (passport : String) -> [String.SubSequence] in 
        passport.split(separator: " ")
    }

let ex1 = input
    .filter { (passports: [String.SubSequence]) -> Bool in
        passports.count == 7 && !(passports.contains { $0.contains("cid") == true }) || 
        passports.count == 8
    }
    .count
print(ex1)
//137 > x < 242