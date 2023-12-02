import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./test.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

print(
