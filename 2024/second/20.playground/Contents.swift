import UIKit

// controll flow

// for-in loops
let names = ["kim", "jeon", "lee", "cho"]
let numbers = [1,2,3,4,5,6,7]

for name in names {
    name
}

for _ in numbers {
    print("요소를 안쓰려면 언더바로 해도됨")
}

let myRange = (0...5)
let myRange2 = (0..<6)

for index in myRange{
    print(index)
}

// index와 Element 같이 가져오기 enumerated
for (index, name) in names.enumerated() {
    print(index, "번째 요소 ::: ", name)
}

let minutes = 60

// 5분 마다 print => for 자체는 60번 돈다. 비효율
for minute in 0..<minutes {
    if minute % 5 == 0 {
        print(minute)
    }
}

// 이게 더 효율적
// 0..<minutes
for minute in stride(from:0 , to: minutes, by: 5) {
    print(minute)
}

// 0...minutes
for minute in stride(from:0 , through: minutes, by: 5) {
    print(minute)
}
