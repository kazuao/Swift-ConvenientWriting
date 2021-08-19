import UIKit

// debugモードの時にだけ動く

/* Assertions */
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// ここで失敗し、アプリが終了する

// すでにチェック済の条件の場合、assertionFailureを使う
if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}

/* Preconditions */
// 基本的にはないが、入る可能性のあるエラーの場合につかう
// 事前にチェックをする
let index = -2
precondition(index > 0, "Index must be greater than zero.")

// 本番環境でも動かしたい場合は、fatalErrorを使う
