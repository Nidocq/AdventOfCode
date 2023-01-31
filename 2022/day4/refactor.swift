// inspiration from
//https://github.com/HarshilShah/AdventOfCode/blob/main/2022/Sources/2022/Day4.swift
import Foundation

let File_Name_URL : URL = URL(fileURLWithPath: "./test.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)


let exercise1 =
    raw_input
        .split(separator: "\n")
        .map{ parsing($0) }
        .map { print($0.0) }


print(exercise1)
func parsing(_ input: Substring) -> (ClosedRange<Int>, ClosedRange<Int>) {
    let parsed_numbers = input.split(whereSeparator: {$0.isNumber == false}).map{ Int($0)!}
    return (parsed_numbers[0]...parsed_numbers[1], parsed_numbers[2]...parsed_numbers[3])
}