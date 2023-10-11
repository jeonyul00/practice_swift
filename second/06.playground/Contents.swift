import UIKit

// Numeric2

var myScore  = 1000000
var myScore1 = 1_000_000

myScore == myScore1 // true
type(of: myScore1) // Int

// 0b : 2진수
var myBit = 0b0110101010101000101
var myBit2 = 0b011_0101_0101_0100_0101
myBit
myBit2
myBit == myBit2 // true


// 0o : 8진수
var myBit3 = 0o756
myBit3

// 0x : 16진수
var myBit4 = 0x756
myBit4

// reminder %
var reminder = 10 % 5 // 나머지
reminder // 0

// 순환소수 문제 해결 -> Decimal
0.7 + 0.2 // 0.89999999999999999
Decimal(0.7 + 0.2) // 0.9
