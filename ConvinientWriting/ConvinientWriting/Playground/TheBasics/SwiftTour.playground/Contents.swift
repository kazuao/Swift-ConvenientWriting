import UIKit

sugerClosure()

// switch: where
func switchWhere() {
    let vegetable = "red pepper"
    
    switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
        
    case "cucumber", "watercress":
        print("That would make a good teea sandwich.")
        
    case let x where x.hasSuffix("pepper"): // 接尾語がpepperか, hasPrefixで接頭語
        print("Is it a spicy \(x)?")
        
    default:
        print("Everything tastes good in soup.")
    }
}


// for - in
func forIn() {
    
    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibonacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25],
    ]
    
    var largest = 0
    // key, valueになっている
    for (_, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
            }
        }
    }
    print(largest)
}


// while, repeat
func whileRepeat() {
    
    var n = 2
    while n < 100 {
        n *= 2
    }
    print("n: \(n)")
    
    // whileの判定のタイミングがあとになる
    var m = 2
    repeat {
        m *= 2
    } while m < 100
    print("m: \(m)")
}

// function nest
func nestFunction() {
    
    // 関数はネストすることができる
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        add()
        return y
    }
    print(returnFifteen())
}

// return function
func returnFunction() {
    
    // addOneを返す関数
    func makeIncrementer() -> ((Int) -> Int) {
        
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    // 関数を変数に代入できる
    let increment = makeIncrementer()
    print(increment(7))
}

// arg function
func argFunction() {
    
    // 引数に関数を入れられる
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    let numbers = [20, 19, 7, 12]
    hasAnyMatches(list: numbers, condition: lessThanTen)
}

// closure
func closure() {
    // 上のargFunctionを書き換えたタイプ
    let numbers = [20, 19, 7, 12]
    numbers.map({ (number: Int) -> Int in
        let result = 3 * number
        return result
    })
}

// suger closure
func sugerClosure() {
    let numbers = [20, 19, 7, 12]
//    let mappedNumbers = numbers.map { number in 3 * number } // こうもかける
    let mappedNumbers = numbers.map { $0 * 3 }
    print(mappedNumbers)
    // [60, 57, 21, 36]
}

// sorted closure
func sortedClosure() {
    let numbers = [20, 19, 7, 12]
    let sortedNumbers = numbers.sorted { $0 > $1 }
    print(sortedNumbers)
    // [20, 19, 12, 7]
}
