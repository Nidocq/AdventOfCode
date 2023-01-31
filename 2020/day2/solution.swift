import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "input.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

struct PasswordPolicy {
    let range : ClosedRange<Int>
    let char : Character
    let password : Substring
}

extension Bool {
    static func ^(left: Bool, right: Bool) -> Bool {
        return left != right
    }
}
extension PasswordPolicy {
    func i(index: Int) -> Character {
      self.password[self.password.index(self.password.startIndex, offsetBy: index)]
    }

    func fst() -> Int {
        return self.range.first!
    }
    func snd() -> Int {
        return self.range.last!
    }
}

let input = raw_input
    .split(separator: "\n")
    .map { $0.split(separator: ":")} 
    .map {(str : Array<Substring>) -> PasswordPolicy in // map over the policy:password
        let policySplit = str[0].split(separator: " ")
        let rangeSplit = policySplit[0].split(separator: "-")
        let fst = Int(rangeSplit[0])!
        let snd = Int(rangeSplit[1])!
        return PasswordPolicy.init(range: (fst...snd), char: policySplit[1].first!, password: str[1])
    }

let ex1 = input
    .filter {(pass : PasswordPolicy) in 
        pass.range.contains(pass.password.filter{$0 == pass.char}.count)
    }.count

print(ex1)

let ex2 = input
    .filter {(pass : PasswordPolicy) in 
                                                     //Xor gate
        return (pass.i(index: pass.fst()) == pass.char) ^ 
               (pass.i(index: pass.snd()) == pass.char)
    }.count
    
print(ex2)
