import UIKit

// 열거형

enum GenderType {
    case man
    case woman
}

var genderType: GenderType!

func showGender(type:GenderType) {
    print(type)
}

showGender(type: .man) // String 아님 GenderType

enum GenderType2: String {
    case man = "남자"
    case woman = "여자"
}

var genderType2: GenderType2!

func showGender2(type:GenderType2) {
    print(type.rawValue)
    
    switch type {
    case .man:
        print("스위치 케이스 남")
    case .woman:
        print("스위치 케이스 여")
    }
}

showGender2(type: .man) // String

// case iterable -> 배열처럼 쓰기
enum Drink: String, CaseIterable { // 왜 String을 먼저 써야되지? 뒤에 쓰면 안되는 이유는 뭐지
    case coffee
    case juice
    case tea
    case bear
}

let drink = Drink.allCases
var myDrink = Drink.coffee
drink[1]

for element in drink {
    print(element.rawValue)
}

func findDrink(name:String) {
    drink.forEach { element in
        if element.rawValue == name {
            print("타입에 맞는 음료가 있음 : ", name)
            myDrink = element
        }
    }
}

findDrink(name: "tea")
myDrink.rawValue

// 타입 선택 + 값
enum Rectangle {
    case triangle(width: Int, height: Int, angle: Int)
    case circle(radius: Int)
}

var triangle1 = Rectangle.triangle(width: 100, height: 50, angle: 90)
// 값 왜 못가져오지

// Rectangle.triangle로 가져 올 수 있으면 ~
if case let Rectangle.triangle(너비, 높이, 각도) = triangle1 {
    print(너비, 높이, 각도)
}

// ||
switch triangle1 {
    case .triangle(let 너비, let 높이, let 각도):
        print(너비)
    case .circle(let radius):
        print(radius)
}
