import UIKit

var myScore = 1_000_000
var myScore1 = 1_000_000

myScore == myScore1 // true -> 값 타입이 때문이지

var myBit = 0b00010001 // 2진수
var myBit2 = 0o00010001 // 8진수
var myBit3 = 0x00010001 // 10진수

// reminder %
var reminder = 10 / 5 // 2
var reminder2 = 10 % 5 // 0

let num1 = 0.7
let num2 = 0.2

num1 + num2 // 0.899999999 -> 왜? 순환 소수기 때문 -> 0.7이 2진수로 변환했을 때 순환소수가 됨
Decimal(num1 + num2) // 0.9 ㅇㅋ? 정확한 값을 원하면 Decimal ㄱㄱ
