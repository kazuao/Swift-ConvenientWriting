//
//  Swift4ErrorTypeViewController.swift
//  ConvinientWriting
//
//  Created by k-aoki on 2021/09/01.
//

import UIKit

class Swift4ErrorTypeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    /*
     - Simple domain error: 全体条件が明確
     - Recoverable error:   原因ごとに対応
     - Universal error:     回復不能
     - Logic error:         コードの誤り
     */
    
    // Simple domain error
    // 発生条件が明確
    // 結果がわかればいいという考え
    func exampleSimpleDomainError(string: String) {
        // stringは数値に変換できない値が来た
        guard let number = Int(string) else {
            print("整数を入力してください")
            return
        }
        // numberを使う処理
        print(number)
    }
    
    // Recoverable error
    // ファイル入出力やネットワークエラーがあがられる
    // 発生条件が明確でなく、どのように回復すべきか原因によって対応が異なるので、その手段を提供するべきという考え
    enum FileError: Error {
        case noSuchFile
        case permissionDenied
    }
    
    func exampleRecoverableError(url: URL) {
        
        do {
            let data = try Data.init(contentsOf: url)
            // dataを使う処理
            print(data)
        } catch FileError.noSuchFile {
            // ファイルがない場合のエラー処理
        } catch FileError.permissionDenied {
            // パーみっそがない場合のエラー処理
        } catch {
            // その他のエラー処理
        }
    }
    
    // Universal error
    // メモリ不足やスタックオーバーフローなどが考えられる
    // 利用者側で対応しようがないので、即座に停止すべきという考え
    func exampleUniversalError() {
        
        func reduce<T, R>(_ range: CountableRange<T>, _ initial: R, _ combine: (R, T) -> R) -> R {
            guard let first = range.first else { return initial }
            
            return reduce(
                range.startIndex.advanced(by: 1) ..< range.endIndex,
                combine(initial, first),
                combine
            )
        }
        
        print(reduce(0..<1000000, 0) { $0 + $1 }) // スタックオーバーフローでクラッシュ
    }
    
    // Logic failure
    // Arrayのindexが這い出してしまった場合や、
    // nilの入っているOptionalに対して、ForcedUnwrappingを実行してしまった場合等
    // 実装が間違っているという考え
    func exampleLogicFailure() {
        let array = [2, 3, 5]
        print(array[3])
    }
}
