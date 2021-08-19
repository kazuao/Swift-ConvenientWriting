import UIKit

/* Generics */
func makeArray<T>(repeating item: T, numberOfTimes: Int) -> [T] {
    
    var result = [T]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    
    return result
}
print(makeArray(repeating: "knock", numberOfTimes: 4)) // ["knock", "knock", "knock", "knock"]

// Swift標準ライブラリのオプショナル型の再実装
enum OptionalValue<T> {
    case none
    case some(T)
}
var possibleInteger: OptionalValue<Int> = .none
print(possibleInteger) // none
possibleInteger = .some(100)
print(possibleInteger) // some(100)

// 要件の一覧を指定するために、本文の直前にwhereを使う。
// ・プロトコルを実装するために型が必要な場合
// ・2つの型が一致している必要がある場合
// ・クラスが特定のスーパークラスを継承している必要がある場合
// など

// TがEquatableに準拠、TとUが一緒の型であること
func anyCommonElementes<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
    
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    
    return false
}
print(anyCommonElementes([1, 2, 3], [4])) // false
print(anyCommonElementes([1, 2, 3], [3])) // true
