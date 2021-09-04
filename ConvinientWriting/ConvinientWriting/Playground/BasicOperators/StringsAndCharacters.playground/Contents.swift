import UIKit

/* Strings and Charactors */

// 複数行の文字列は、["」を3つ重ねる
let multipleLines = """
    複数行を書くときは、
    だぶるくおーてーしょんを
    3つ重ねるとできるようになる。
        インデントも使える
    最後の行をスペースのみにすると改行を荒スァす
    
    """

// ユニコードもかける
let heart = "heart: \u{1F496}"
print(heart)

// 文字列は値型

// 文字列もループができる
for charactor in heart {
    print(charactor) // h, e, a, r, t, 💖
}

// appendを使用して文字列に追加することができる
let add = "!"
var welcome = "welcome"
welcome.append(add)
print(welcome) // welcome!


// 文字列の位置を取得する
let greeting = "Guten Tag!"
greeting[greeting.startIndex] // G
//print(greeting[greeting.endIndex]) // 文字の数になるため、そのまま使うと、out of indexになる
// startIndexは、最初
// endIndexは、最後
print(greeting[greeting.index(before: greeting.endIndex)])  // !
print(greeting[greeting.index(after: greeting.startIndex)]) // u
// afterはindexの後、beforeはindexの前
let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index]) // a

// 全部のindexにアクセスするとき
for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "") // G u t e n   T a g !
}

// 文字列に文字列を挿入する
var hello = "hello"
hello.insert("!", at: welcome.endIndex) // hello!
hello.insert(contentsOf: " there", at: hello.index(before: welcome.endIndex)) // hello there!

// 文字列の削除
hello.remove(at: hello.index(before: hello.endIndex)) // hello there
let range = hello.index(hello.endIndex, offsetBy: -6)..<hello.endIndex // 一番最後から数えて6文字分もrangeを作る
hello.removeSubrange(range) // hello

// 前方一致、後方一致
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1") // There are 5 scenes in Act 1

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes") // 6 mansion scenes; 2 cell scenes
