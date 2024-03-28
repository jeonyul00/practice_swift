import UIKit

// 열거형 (enumeration) 은 관련된 값의 그룹을 위한 일반 타입을 정의하고 코드에서 타입-세이프 방법으로 값을 동작하게 합니다.
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}


var directionToHead = CompassPoint.west
print(directionToHead)
print("west")

directionToHead = .north
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

// 열거형 반복

enum Test: CaseIterable {
    case a
    case b
    case c
}

let test = Test.allCases
for i in test {
    print(i)
}

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(1, 2, 2, 1)

// 원시값 (Raw Values)
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
// 암식적 원시값
enum Planet2: Int {
    case mercury = 1
    case venus // 2
    case earth // 3
}
enum CompassPoint2: String {
    case north, south, east, west // String으로 가지고있음
}
let earthsOrder = Planet2.earth.rawValue
let sunsetDirection = CompassPoint2.west.rawValue
let possiblePlanet = Planet2(rawValue: 7)
print(possiblePlanet) // nil
let possiblePlanet2 = Planet2(rawValue: 2)
print(possiblePlanet2) // Planet2.venus?

// 재귀 열거형 => 이건 또 뭐야
// 열거형 케이스에 하나 이상의 연관된 값으로 열거형의 다른 인스턴스를 가지고 있는 열거형입니다.
// 열거형 케이스가 재귀적임을 나타내기 위해 케이스 작성 전에 indirect 를 작성하여 컴파일러에게 필요한 간접 (indirection) 계층을 삽입하도록 지시합니다.
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}
