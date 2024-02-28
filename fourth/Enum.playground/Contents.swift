import UIKit

var greeting = "Hello, playground"


enum GenderType:String {
    case man
    case woman = "Female"
    case type1
    case type2
}

var genderType1 = GenderType.man
var genderType2: GenderType


func showGender(_ type:GenderType){
    print(type.rawValue)
}
showGender(.man)
showGender(.woman)


enum Beverage:String,CaseIterable {
    case coffee
    case juice
    case tea
}

let arr = Beverage.allCases
arr.forEach { Beverage in
    print(Beverage.rawValue)
}


// ---
enum value {
    case a(x:Int , y:Int , z:Int)
    case b(x:Int)
}

let data = value.a(x: 1, y: 2, z: 3)

if case let value.a(x, y, z) = data {
    print(x,y,z)
}

