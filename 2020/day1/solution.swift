import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)


let input = raw_input
    .split(separator: "\n")
    .map {(str : Substring) -> Int in Int(str)!}


let ex1 = input
    .filter { (num : Int) -> Bool in
        input.contains(2020-num) 
    }
    .reduce(1, *)

print(ex1)

let ex2 = input
    .filter { (num : Int) -> Bool in
        input.map { (snum : Int) -> Bool in 
            input.contains(2020-num-snum) 
        }.contains(true)
    }
    .reduce(1, *)

print(ex2)
    