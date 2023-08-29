import UIKit

// Numeric type2
// _ 허용 : 무시됨 : 가독성을 위해 쓸 수 있을 듯
var myScore = 1000000
var myScore1 = 1_000_000
myScore == myScore1

// 0b : 2진수 바이너리 코드로 표현
var myBit = 0b0001_0001_1111
var myBit2 = 0b000100011111
type(of: myBit) // Int

// 0o : 8진수 표현
var myBit3 = 0o10

// 0x : 16진수
var myBit4 = 0x10

// % : remainder : 나머지
var remainder = 10 % 3

// 이거 저 소수점을 메모리에 넣기 전 2진수로 변환할 때 무한소수가 되어서 중간에 끊는 개념이었는데 : 나중에 알아볼 것
var number1 = 0.7
var number2 = 0.2
var sum = number1 + number2
sum // 0.899999999...

// Decimal : 10진수로 표현
Decimal(sum)
