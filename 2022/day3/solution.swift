import Foundation

let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

let rucksacks = 
    raw_input.components(separatedBy: "\n")

func CommonItems() -> [String] {
    var common_items : [String] = []
    for r in rucksacks {
        let r_middle : String.Index = r.index(r.startIndex, offsetBy: r.count/2)
        let left_half = r[r.startIndex..<r_middle]
        let right_half = r[r_middle..<r.endIndex]
        var prev_letter : String = ""
        for chr in right_half where left_half.contains(chr) {
            // Prevents already seen letters to appear, influxing the score
            if !prev_letter.contains(chrString) {
                // Concat string to prev_letter
                prev_letter += chrString
                common_items.append(chrString)
            }
        }
    }
    return common_items
}

func GetChrSignificance(chr: String) -> Int {
    // Will get the range from the ascii table approprite for the
    // assignment
    if chr.lowercased() != chr {
        return Int(UnicodeScalar(chr)!.value)-38
    } else {                               
        return Int(UnicodeScalar(chr)!.value)-96
    }
}

let TotalSignificance = 
    CommonItems().map {
        GetChrSignificance(chr: $0)
    }
    //  don't reduce the list, and we want addative reducing
    .reduce(0, +)


print("Exercise 1: \(TotalSignificance)")

// ------------------------------------------------------
var common_badge : [String] = []
for i in stride(from: 0, to: rucksacks.count, by: 3) {
    let ite = rucksacks
    var prev_letter : String = ""
    for first_chr in ite[i] where ite[i+1].contains(first_chr) && 
                                  ite[i+2].contains(first_chr) {
        if !prev_letter.contains(first_chr) {
            let strChr = String(first_chr)
            prev_letter += strChr
            common_badge.append(strChr)
        }
    }
}

let TotalBagdeSignificance = 
    common_badge.map {
        GetChrSignificance(chr: $0)
    }
    .reduce(0, +)

print("Exercise 2: \(TotalBagdeSignificance)")

