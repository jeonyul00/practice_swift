import UIKit

// protocol extention : 추가적인 기능을 확장한다.
protocol RandomGenerator {
    func randomNumber() -> Int
}

extension RandomGenerator {
    func randomNumber() -> Int {
        Int.random(in: 1...10)
    }
}

struct UserData:RandomGenerator {
    func randomNumber() -> Int {
        Int.random(in: 10...20)
    }
}

var userData = UserData()
userData.randomNumber() // extension으로 이미 확장해서 가능
// 만약 struct에서 다시 구현한다면 이게 우선 순위이다.

// 프로토콜 합성
protocol Named {
    var name:String { get set }
}

protocol aged {
    var age:Int { get set }
}

struct PersonData: Named, aged {
    var name: String = "kim"
    var age: Int = 30
}

// 이것도 되지만 프로토콜 기준으로 프로퍼티를 받고싶다면
// func showPersonData(person:PersonData){}

func showPersonData(person: Named & aged){
    print(person.name)
    print(person.age)
}

showPersonData(person: PersonData())

var personData = PersonData()
personData.name = "jeonyul"
showPersonData(person: personData)
