import UIKit

// 프로토콜 확장

protocol RandomGenerator {
    func randomNumber() -> Int
}

extension RandomGenerator {
    func randomNumber()-> Int {
        return Int.random(in: 1...10)
    }
}

struct UserData:RandomGenerator {
    
}

let userData = UserData()
userData.randomNumber()

struct UserData2:RandomGenerator {
    // 재선언, 이게 우선순위
    func randomNumber() -> Int {
        return Int.random(in: 10...100)
    }
}

let userData2 = UserData2()
userData2.randomNumber()

// protocol 합성
protocol Named {
    var name: String { get set }
}

protocol Aged {
    var age: Int { get set }
}

struct User: Named, Aged {
    var age: Int
    var name: String
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

func show(user: Named & Aged) {
    // 블라블라
}
