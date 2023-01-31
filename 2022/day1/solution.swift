import Foundation
// Inspiration from https://github.com/HarshilShah/AdventOfCode/blob/main/2022/Sources/2022/Day1.swift

let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

let total : [Int] = raw_input
                .components(separatedBy: "\n\n")
                .map { $0
                        .split(separator: "\n")
                        .map { Int($0)! }
                        .reduce(0, +)
                     }

print(total.max()!) // ex 1
print(total.sorted().suffix(3).reduce(0, +)) // ex 2