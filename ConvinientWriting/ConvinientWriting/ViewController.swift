//
//  ViewController.swift
//  ConvinientWriting
//
//  Created by k-aoki on 2021/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    /// 非公開APIを使わずに端末のロック状態を取得
    let lockStateDetection = LockStateDetectionViewController()
    
    /// パスワードの失敗はタイプでみる
    let passwordLockForType = PasswordLockForTypeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

