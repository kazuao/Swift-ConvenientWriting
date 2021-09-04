//
//  PasswordLockForTypeViewController.swift
//  ConvinientWriting
//
//  Created by k-aoki on 2021/08/16.
//

import UIKit

class PasswordLockForTypeViewController: UIViewController {
    
    struct PasswordFailed {
        var failedPassword: String
        var failedCount: Int = 0
        
        mutating func incrementFailedCount() {
            self.failedCount += 1
        }
    }
    
    var faileds = [PasswordFailed]()
    
    let correctPassword = "Aa12345678"
    
    /**
     参考: https://qiita.com/yuba/items/d815a6c409968f2dd011
     
     パスワードロック機能は誤入力の回数ではなく、種類で行う
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let failedPassword1 = "hogehoge"
        let failedPassword2 = "fugafuga"
        let failedPassword3 = "hogehoge"
        let failedPassword4 = "hogehoge"
        let failedPassword5 = "hogehoge"
        
        let failedsPass = [failedPassword1, failedPassword2, failedPassword3, failedPassword4, failedPassword5]
        
        for failedPass in failedsPass {
            
            checkInsertPassword(insertPass: failedPass)
        }
    }
}

private extension PasswordLockForTypeViewController {
    
    /// パスワードのチェックを行う
    /// 1. 8文字以上 ~ 32文字以内
    /// 2. correctPasswordと同じ
    ///
    /// - Parameters:
    ///    - insertPass: 入力パスワード
    func checkInsertPassword(insertPass: String) {
        
        print(faileds)
        
        // check insert text count
        if 8 > insertPass.count && insertPass.count > 32 {
            print("count over")
            failedPasswordCheckAndSave(failedPassword: insertPass)
            return
        }
        
        // failed
        if correctPassword != insertPass {
            print("incorrect")
            failedPasswordCheckAndSave(failedPassword: insertPass)
            return
        
        // success
        } else {
         
            print("success!")
            faileds = [] // reset
        }
    }
    
    func failedPasswordCheckAndSave(failedPassword: String) {
        
        // 入力失敗したパスワードが存在するか
        let isFaileds = faileds.filter { $0.failedPassword == failedPassword }
        
        // 失敗回数が3回を超える場合
        if let failed = isFaileds.first, failed.failedCount > 3 {
            
            print("失敗回数が3回を超えています。最初からやり直して。")
            return
        }
        
        // 失敗回数が0でない場合、追加をする
        if isFaileds.count != 0 {
            
            for (index, failed) in isFaileds.enumerated() {
                
                if failed.failedPassword == failedPassword {
                    faileds[index].incrementFailedCount()
                }
            }
            
        // 存在しない場合、作成→追加する
        } else {
            let data = PasswordFailed.init(failedPassword: failedPassword)
            faileds.append(data)
        }
    }
}
