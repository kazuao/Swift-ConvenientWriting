import UIKit

/* Tuples */
// 型は関係なく、要素の順番が必要
let http404Error = (404, "Not Found")

// 使い方
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)") // The status code is 404
print("The status message is \(statusMessage)") // The status message is Not Found

// 使わないところは無視できる
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)") // The status code is 404

// indexでもアクセスできる
print("The status code is \(http404Error.0)") // The status code is 404
print("The status message is \(http404Error.1)") // The status message is Not Found

// 作成時に名前をつけられる
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)") // The status code is 200
print("The status message is \(http200Status.description)") // The status message is OK
