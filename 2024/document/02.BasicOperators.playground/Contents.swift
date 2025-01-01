import UIKit

var a = 1
var b = 2
var c = 3
let d:Int
d = a == 1 ? b : c
let (x, y) = (1, 2) // 마치 구조분해 할당같아.

// 숫자 값의 부호는 - 접미사를 사용하여 변경할 수 있으며 이것을 단항 뺄셈 연산자 (unary minus operator) 라고 합니다.
let three = 3
let minusThree = -three       // -3
let plusThree = -minusThree   // 3
// 단항 덧셈 연산자 (+)는 어떠한 변경없이 그 값을 그대로 반환합니다:
let minusSix = -6
let alsoMinusSix = +minusSix  // -6, 그럼 뭐 어쩌지?
let alsoMinusSix2 = abs(minusSix)

// tuple 비교
(1, "zebra") < (2, "apple")   // true
(3, "apple") < (3, "bird")    // true , 알파벳 순서상 "apple"이 "bird"보다 먼저 옵니다.
(4, "dog") == (4, "dog")      // true
("blue", -1) < ("purple", 1)  // true , 알파벳 순서상 "apple"이 "bird"보다 먼저 옵니다.

// nil 결합 연산자
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

// 범위 연산자
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// 반열림 범위
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// 단방향 범위
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}
for name in names[..<2] {
    print(name)
}

let range = ...5
range.contains(7)   // false
range.contains(4)   // true
range.contains(-1)  // true
