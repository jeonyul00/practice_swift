import UIKit

// enum
enum GenderType:String {
    case man = "male"
    case woman = "female"
    case type1
    case type2
}

var genderType = GenderType.man
var genderType2:GenderType?

func showGender(type:GenderType){
    print("type ::: " + type.rawValue) // string 아님 -> 그럼 string으로 하려면? rawValue
}

showGender(type: .man)

func showGender2(type:GenderType){
    switch type {
    case .man:
        print("남")
    case .woman:
        print("여")
    default:
        print(type.rawValue)
    }
}

showGender2(type: .man)


// ---
// caseIterable : 어레이처럼 묶음으로 사용할 수 있도록 한다.
enum Beverage: String, CaseIterable {
    case coffee
    case juice
    case tea
}

let beverage = Beverage.allCases
beverage // [coffee, juice, tea]

for element in beverage {
    print(element.rawValue + "") // string으로 쓰려면 enum에서 스트링을 확장해야함 근데 저 확장 순서도 중요함 String 먼저
}

func findBeverage(_ name: String){
    Beverage.allCases.forEach { Beverage in
        if Beverage.rawValue == name {
            print("타입에 맞는 음료가 있음")
        }
    }
}

findBeverage("coffee")

// ---
// 타입을 선택 + 값
enum Rectangle {
    case triangle(width:Int, height:Int, angle:Int)
    case circle(radius: Int)
}

var triangle = Rectangle.triangle(width: 100, height: 50, angle: 90)

if case let Rectangle.triangle(width, height, angle) = triangle {
    print(width,height,angle)
}
