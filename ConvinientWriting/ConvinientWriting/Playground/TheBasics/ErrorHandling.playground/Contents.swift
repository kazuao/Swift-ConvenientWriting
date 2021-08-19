import UIKit

/* Error Handling */
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

// throwsがついている関数は、エラーをスローするかもしれない
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// do try catchでハンドリングする方法
do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
    
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
    
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
    
} catch {
    print(error)
}

// try?でハンドリングする方法
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

// 成功の可否にかかわらず、最後に処理を行いたい場合
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
print(fridgeContains("banana"))
print(fridgeContains("milk"))
print(fridgeIsOpen)
