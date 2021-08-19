import UIKit

/* Operators */

/**
 単項: unary   -> -a, !b, c! (prefix, postfix)
 二項: binary  -> 2 + 3 (infix)
 三項: ternary -> a ? b : c
 値の部分をオペランドという(operand)
 */

// 単項減算演算子 (Unary Minus Operator)
let three = 3
let minusThree = -three     // -3
let plusThree = -minusThree // 3
// -とoperandの間にスペースを入れない

// 単項加算演算子 (Unary Plus Operator)
let minusSix = -6
let alsoMinusSix = +minusSix // -6

// 比較演算子 (Comparison Operators)
// Tupleでもできる
// 左から比較する
(1, "zebra") < (2, "apple") // 1と2を比較しtrue、右は比較しない
(3, "apple") < (3, "bird")  // 3と3は同じ、文字は"apple"の方が小さいのでtrue
(4, "dog") == (4, "dog")    // true

// nil合体演算子 (Nil-Coalescing Operator)
// optionalに対し、nilでなければアンラップする
//let x = a != nil a! : b


// 閉範囲演算子 (Closed Range Operator)
for index in 1...5 {
    print(index) // 1,2,3,4,5
}

// 半開範囲演算子 (Half-Open Range Operator)
// 最後の値を含まない、配列などの0ベースに使うと便利
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print(names[i])
}

// 片側範囲演算子 (One-Sided Ranges)
// 指定の部分から最後まで、最初から指定の部分までのような使い方ができる
for name in names[2...] {
    print(name) // Brian, Jack
}

for name in names[...2] {
    print(name) // Anna, Alex, Brian
}

// 片側範囲も使える
for name in names[..<2] {
    print(name) // Anna, Alex
}

// rangeは代入できる
// 必ず事前にチェックする
let range = ...5
range.contains(7) // false
range.contains(4) // true
range.contains(-1) // true


