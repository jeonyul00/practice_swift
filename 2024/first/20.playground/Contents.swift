import UIKit

// controllflow : 흐름제어

// for-in loops
let names = ["jeon", "kim", "lee"]

for name in names {
    name
}

// enumerated : index와 값 반환
for (index,name) in names.enumerated() {
    print(index,name)
}
 
let numbers = [1,2,3,4,5,6,7,8,9]
let range = (0..<6)

for number in numbers {
    number
}
for number in range {
    number
}

let miutes = 60

// 비효율 : 반복문이 60번 돈다.
for minute in 0..<miutes {
    if minute % 5 == 0 {
        print("5분 마다 알림",minute)
    }
}

// 효율 : 12번 돈다

// 0 ~ 59
for minute in stride(from: 0, to: miutes, by: 5) {
    print("5분 마다 알림",minute)
}

// 0 ~ 60
for minute in stride(from: 0, through: miutes, by: 5){
    print("5분 마다 알림",minute)
}
