import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)
let start_of_marker = 4
let start_of_message = 14
let unique_sequence =
    raw_input
        .reduce("") { x, y in
            var marker = x
            if marker.count > start_of_marker {
                marker.removeFirst()
            }
            let length = marker.count
            if marker.count == start_of_marker {
                // All characters are unique
                if Set(marker).count ==  length {
                    return marker
                }
            }
            return marker + String(y)
        }
        
let upper_range = raw_input.range(of: unique_sequence)!.upperBound

let sequence_index: Int =
    raw_input[raw_input.startIndex..<upper_range].count

print(sequence_index)