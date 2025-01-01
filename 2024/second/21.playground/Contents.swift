import UIKit


// controll flow
// while : 반복의 끝이 정해지지 않았을 때

var dice = 0
var myPosition = 0

while myPosition < 10 {
    dice = Int.random(in: 0...6)
    myPosition += dice
}

