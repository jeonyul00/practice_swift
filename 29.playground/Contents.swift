import UIKit

// enum : 열거형

// 생성
enum GenderType:String {
    case man = "남자"
    case woman = "여자"
    case type1
    case type2
}

var genderType = GenderType.man
var genderType2: GenderType?

func showGender(type:GenderType){
    switch type {
    case .man:
        print("남")
        break
    case .woman:
        print("여")
        break
    default:
        print("type1, type2")
    }
}

showGender(type: GenderType.man)
showGender(type: .woman)

print(type(of: GenderType.man)) // GenderType
print(type(of: GenderType.man.rawValue)) // string

// x : Cannot convert value of type 'String' to expected argument type 'GenderType'
// showGender(type: "other type")


// CaseIterable : enu을 배열처럼 묶음으로 사용하도록 한다.
enum Beverage:String, CaseIterable {
    case coffee
    case juice
    case tea
}

let enumArr = Beverage.allCases
enumArr
enumArr.count
enumArr[0]

for element in enumArr {
    print(element.rawValue)
}

// 외부에서 enum 확인
func findBeverage(_ name:String){
    Beverage.allCases.forEach { Beverage in
        if Beverage.rawValue == name {
            print("타입에 맞는 음료가 있음")
        }
    }
}

findBeverage("coffee")
findBeverage("coffe")

enum Rectangle {
    case Triangle(width : Int, height : Int, angle : Int)
    case Circle(radius : Int)
}

var triangle = Rectangle.Triangle(width: 100, height: 50, angle: 50)

if case let Rectangle.Triangle(width, height, angle) = triangle {
    print(width, height, angle)
}

switch triangle {
case .Triangle(let width, let height, let angle):
    print(width, height, angle)
    break
case .Circle(let radius):
    print(radius)
    break
}

// if case let
enum 떡볶이 {
    case 짜장
    case 치즈
    case 짜장치즈(짜장비율 : Double, 치즈비율 : Double)
}

let 내떡볶이 = 떡볶이.치즈

switch 내떡볶이 {
case .치즈:
    print("치즈를 올리기")
    break
case .짜장:
    print("짜장 떡볶이를 누가 돈주고 사먹음?")
    break
default:
    break
}

// 위의 방법은 참 귀찮다 -> if let case 문법으로 해결
if case .치즈 = 내떡볶이 { print("치즈를 올리기") } // 내떡볶이 인스턴스가 치즈 case라면 if 실행, let 어디감? : 여기선 필요없음 => 그럼 어디서 필요하냐? 그건 밑의 예시

// if case let
let 개맛없는떡볶이 = 떡볶이.짜장치즈(짜장비율: 1, 치즈비율: 1)
if case let .짜장치즈(짜비, 치비) = 개맛없는떡볶이 {
    print("짜장의 비율은 : ", 짜비)
    print("치즈의 비율은 : ", 치비)
}

// 한 번 더
enum 탈것 {
    case 따릉이(speed: Int, color:String)
    case 킥고잉
    case 말
}

let myTransport = 탈것.따릉이(speed: 80, color: "rainbow")

// myTransport가 .따릉이(속도,_) case에 포함되어 있다가 참이면? {} <- 클로저인가? : todo 알아볼 것
if case let .따릉이(속도, _) = myTransport {
    print("I'm driving at \(속도) km/h")
} else {
    print("I'm not driving")
}
