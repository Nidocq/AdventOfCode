import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

var visibleTrees : Int = 0

let rows =
    raw_input
        .components(separatedBy: "\n")
        .dropLast() // last element is ""

for column in 0...rows.count-1 {
    for row in 0...rows[column].count-1 {
        let r : String = rows[column]
        let currentNumber = r[r.index(r.startIndex, offsetBy: row)]
        // The trees that are on the edge 
        if ((column == 0 || row == 0) || 
            (column == rows.count-1 || row == rows[column].count-1)) {
            visibleTrees += 1
            continue
        }
        // left side comparison 
        let leftSide : [Int] = r.prefix(row)
                                    .split(separator: "").map { Int( $0 )! }

        if (leftSide.allSatisfy { Int(String(currentNumber))! > $0 }) {
            visibleTrees += 1
            continue
        }

        // Take the rest of the list EXLUDING the same number we are on hence -1
        let rightSide : [Int] = r.suffix(r.count-row-1)
                                    .split(separator: "").map { Int ( $0 )! }
    
        if (rightSide.allSatisfy { Int(String(currentNumber))! > $0 }) {
            visibleTrees += 1
            continue
        }
        
        var up : [Int] = []
        var down : [Int] = []

        for i in 0..<rows.count { 
            // We don't want the same number
            if (i == column) {
               break 
            }
            // String -> Int because swift will not convert chr -> Int, but
            // chr -> String -> Int it will comply
            up.append( Int( String(rows[i][rows[i].index(rows[i].startIndex, offsetBy: row)]) )! )
        }

        for i in stride(from: rows.count-1, through: 0, by: -1) {
            if (i == column) {
                break
            }
            down.append( Int( String(rows[i][rows[i].index(rows[i].startIndex, offsetBy: row)]) )! )
        }

        if (up.allSatisfy { Int(String(currentNumber))! > $0 }) {
            visibleTrees += 1
            continue
        }

        if (down.allSatisfy { Int(String(currentNumber))! > $0 }) {
            visibleTrees += 1
            continue
        }


    }
}


print("visible trees \(visibleTrees)")
