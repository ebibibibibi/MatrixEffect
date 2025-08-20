//
//  Person.swift
//  MatrixRainEffect
//
//  Created by KotomiTakahashi on 2025/08/20.
//

// MARK: - メモリテスト用クラス（循環参照）
class Person {
    let name: String
    var instrument: String = ""

    init(name: String) {
        self.name = name
    }
    lazy var getName: () -> String = { [weak self] in
        return "\(self?.name) " // selfの参照カウントが+1
        }

    deinit {
        print("❌ \(name) is being deinitialized")
    }
}
