//
//  LockStateDetectionViewController.swift
//  ConvinientWriting
//
//  Created by k-aoki on 2021/08/10.
//

import UIKit
import LocalAuthentication

/*
 参考: https://qiita.com/shiba1014/items/63a7823160c26fcd1381
 
 非公開APIを使わずにiPhoneのロック状態を検知する
 
 パスコードがセットされていない場合は、通知が届かない
 その場合は、`.canEvaluatePolicy`にfalseが返ってくる
 */

class LockStateDetectionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    func addObserveLockStateDetection() {
     
        let isPasscode = LAContext().canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        if !isPasscode {
            // 他にfalseになるパターンがあると思うがとりあえず仮で置く
            print("パスコードが設定されていません。")
        }
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(changedAppStatus(_:)),
                         name: UIApplication.protectedDataDidBecomeAvailableNotification,
                         object: nil)
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(changedAppStatus(_:)),
                         name: UIApplication.protectedDataWillBecomeUnavailableNotification,
                         object: nil)
    }
    
    @objc func changedAppStatus(_ notification: Notification) {
        
        if notification.name == UIApplication.protectedDataDidBecomeAvailableNotification {
            
            print("端末がアンロックされました")
            
        } else if notification.name == UIApplication.protectedDataWillBecomeUnavailableNotification {
            
            print("端末がロックされました")
        }
    }
}

