import Foundation
let File_Name_URL : URL = URL(fileURLWithPath: "./test.txt")
let raw_input : String = try String(contentsOf: File_Name_URL, encoding: .utf8)

struct Node<Value> {
    var value : Value
    var size : Int
    private(set) var children: [Node]
    var parent: [Node?]

    mutating func add(child: Node) {
        self.children.append(child)
    }

    func t_up() -> Node {
        return self.parent[0]!
    }

    mutating func addValue(int : Int) {
        self.size += int
    }

    // leaf
    init (_ value : Value, parent : Node?) {
        self.size = 0
        self.value = value
        self.children = []
        self.parent = [parent]
    }

    // Node
    init (_ value: Value, children: [Node], parent : Node?) {
        self.size = 0
        self.value = value
        self.parent = [parent]
        self.children = []
    }
}

extension Node where Value: Equatable {
    func find(_ value: Value) -> Node? {
        if self.value == value {
            return self
        }
        for child in children {
            if let match = child.find(value) {
                return match
            }
        }
    return nil
    }
}

var root : Node<String> = Node<String>("", children: [], parent: nil)
root.add(child: Node("childNode", children: [], parent: root))
var current_node = root
print("")
current_node.add(child: Node("Hey", children : [], parent: nil))

print("root \(root)")
print("curr node \(current_node)")
// print(Node<String>.find("childNode"))

// let splits = raw_input.components(separatedBy: "\n")
// for i in splits {
//     print(i)
//     var current_node : Node<String> = Node<String>("", children: [], parent: nil)
//     var root : Node<String> = Node<String>("", children: [], parent: nil)
//     if i.contains("$ cd /") {
//         var root = Node("/", children: [], parent :nil)
//         current_node = root
//         print("root")
//     } else if i.contains(" ..") {
//         current_node = current_node.t_up()
//         print("traverse OUT")
//     } else if i.contains("$ cd ") {
//         var Node_name = i.split(separator: " ")[2]
//         var ff = root.find(String(Node_name))!
//         current_node = ff
//         // search for node in tree
//     }
//     if i.contains("$ ls") {
//         print("skipping")
//         continue
//     }
//     if i.contains("dir") {
//         print("Root : \(root)")
//         var folder_name = i.split(separator: " ")[2]
//         print("Looking for \(folder_name)")
//         current_node.add(child: Node(String(folder_name), children: [], parent: current_node))
//         print("I have a new node")
//         // make a new node in this node
//     }
//     print(i.split(separator: " ")[0])
//     // current_node.
//     print(current_node)
// }


func TraverseFolder() -> Int {
    return 1
    // If you find a 
    //  - cd <dirname>
    //      - find the node and append the content to the name of the node as childs
    //  - 
}
