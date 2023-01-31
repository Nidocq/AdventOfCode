import Foundation

let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

let pairs = 
    raw_input.components(separatedBy: "\n")


print(pairs)

let pairRanges = 
    pairs
        .map { (range : String) in
            range.components(separatedBy: ",").map { (pair : String) in
                pair.components(separatedBy: "-")
            }
            .map { (chr : [String]) in
                // wtf swift
                Int(chr[chr.startIndex])!...Int(chr[chr.index(chr.startIndex, offsetBy: 1)])!
            }
        }

let RangesWithmatches =
    pairRanges.filter { (cr : [ClosedRange<Int>]) -> Bool in
        let firstIndex = cr[cr.startIndex]
        let secondIndex = cr[cr.index(cr.startIndex, offsetBy: 1)]
        if !firstIndex.overlaps(secondIndex) {
            return false
        }
        let union = firstIndex.clamped(to: secondIndex) 
        if union == secondIndex || union == firstIndex {
            return true
        }
        return false
    }

let RangesOverlap = 
    pairRanges.filter{ cr in 
        let firstIndex = cr[cr.startIndex]
        let secondIndex = cr[cr.index(cr.startIndex, offsetBy: 1)]
        if firstIndex.overlaps(secondIndex) {
            return true
        }
        return false
    }


print(RangesWithmatches.count) // ex 1
print("Overlapping ranges : \(RangesOverlap.count)") // ex 2
