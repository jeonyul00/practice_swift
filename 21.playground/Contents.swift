import UIKit

// controll flow

// while : 반복 끝이 정해지지 않을 때
var dice = 0
var myPosition = 0

while myPosition < 100 {
    dice = Int.random(in: 1...6) // 정수만 나오나? : 그치 Int니까
    myPosition += dice
    print(myPosition)
}
