import UIKit

/*
    Numeric
*/

var myScore = 50 // Int
var myNumber = 50.0 // Double
var myScore2:Double = 50

var unSignedNumber:UInt = 50 // 양수
unSignedNumber = 1000
// x : Negative integer '-1' overflows when stored into unsigned type 'UInt'
// unSignedNumber = -1

UInt8.max // 255
UInt8.min // 0

Int8.max // 127
Int8.min // -128

String(unSignedNumber, radix: 2) // 2진수로 변환
String(unSignedNumber, radix: 16, uppercase: true) // 16진수로 변환
