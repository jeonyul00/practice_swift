import UIKit

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// 자바의 do while 문 같은게 있다.
repeat {
    // 이거 먼저 한 번 실행
} while false
            
// ---
let temperatureInCelsius = 25

let weatherAdvice = if temperatureInCelsius <= 0 {
    "It's very cold. Consider wearing a scarf."
} else if temperatureInCelsius >= 30 {
    "It's really warm. Don't forget to wear sunscreen."
} else {
    "It's not that cold. Wear a T-shirt."
}

print(weatherAdvice) // Prints "It's not that cold. Wear a T-shirt."

// ---
// 스위치 케이스 값 바인딩
let point = (x: 2,y: 0)
switch point {
case (let x, 0):
    print("이게 된다고?2 ::: ", x)
case (2, let y):
    print("이게 된다고?3 ::: ", y)
    // 근데 얘도 맞잖아. 그리고 위에 브레이크 문도 없는데 왜 안나옴 -> 세상에 js랑 다르네; 하나라도 일치하는 값나오면 그거 하고 나간대
default:
    break
}
// ++ 조건문
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// Prints "(1, -1) is on the line x == -y"

// 합성 케이스
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

// 변경 제어 구문: continue, breack, fallthrough, return, throw
// continue 구문은 루프를 통해 다음 반복을 시작하려고 멈추기위해 부릅니다. 이것은 루프를 완전히 벗어나지 않고 "현재 루프 반복은 완료 되었습니다." 라고 말합니다.
// break 구문은 전체 제어흐름 구문을 즉시 종료합니다. break 구문은 switch 내부나 루프 구문에서 switch 또는 루프 구문을 다른 경우보다 일찍 종료시킬 때 사용될 수 있습니다.
// switch 구문 내에서 사용할 때 break 는 switch 구문을 즉시 종료하고 제어를 switch 구문의 닫힌 중괄호 (}) 다음으로 이동시킵니다.
// js 처럼 하나가 걸려도 다음 케이스로 넘어가려면 fallthrough 키워드로 케이스 별로 동작을 선택할 수 있습니다.

// 라벨이 있는 구문 => 이거 뭔가 아주 예전에 한 번 써본 기억이 있는데 => 딱 명시한 하나의 반복문을 멈추고 싶을 때
outerLoop: for i in 1...3 {
    innerLoop: for j in 1...3 {
        if i == 2 && j == 2 {
            break outerLoop // 여기서 outerLoop를 명시적으로 종료
        }
        print("i=\(i), j=\(j)")
    }
}

// !!!!!!!!!!!!!!!!
// 사용 가능한 API 확인
// Swift는 주어진 타겟에서 사용 불가능한 API를 실수로 사용하는 것을 막기위해 사용 가능한 API 확인 (checking API availability)을 제공합니다.
// 컴파일러는 사용된 API가 프로젝트에 특정 타겟에서 사용 가능한지 확인하기 위해 SDK 안에 사용 가능한 정보를 사용합니다. Swift는 사용 불가능한 API에 대해 컴파일 시 에러를 발생합니다.
if #available(iOS 10, macOS 10.12, *) {
    // iOS 10 이상 버전에서만 실행되고 macOS에서는 macOS 10.12 이상 버전에서만 실행됩니다. 마지막 인수 * 는 필수이며 다른 플랫폼에서 if 의 본문이 최소 타겟 버전에서 실행되도록 지정합니다.
} else {
    // Fall back to earlier iOS and macOS APIs
}
