import UIKit

/* Protocol */
protocol ExampleProtocol {
    var simpleDescription: String { get }
    // mutating: デフォルトでクラスで継承した場合は、変更できるが、構造体の場合、つけないと変更できない
    mutating func adjust() // mutatingを消すとコンパイルエラーになる
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
print(a.simpleDescription) // A very simple class. Now 100% adjusted.

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
print(b.simpleDescription) // A simple structure (adjusted)
