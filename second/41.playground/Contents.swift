import UIKit

// protocol extension
protocol RandomGenerator {
    func randomNumber()->Int
}

extension RandomGenerator {
    func randomNumber() -> Int {
        return Int.random(in: 1...10)
    }
}

struct  UserData:RandomGenerator {
    // 만약 여기서 확장을 한 번 더 한다면 이게 먹힘
}

var userData = UserData()

userData.randomNumber()

// composition
protocol Named {
    var name:String { get }
}

protocol Aged {
    var age:Int { get }
}

struct PersonData:Named, Aged {
    var age: Int = 0
    var name: String = ""
}

