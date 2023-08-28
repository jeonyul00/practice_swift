import UIKit

// Numeric
 var myScore = 50
type(of: myScore) // Int

var myNumber = 50.0
type(of: myNumber) // Double

// 0 ~ 256
var myScore2:UInt = 50
// x : Negative integer '-50' overflows when stored into unsigned type 'UInt'
//myScore2 = -50


// bit 제한
var myScore8bit:Int8 = 127
var myScore16bit:Int16 = 258
var myScore32bit:Int32 = 1111111111
var myScore64bit:Int64 = 111111111111

// 진수 변환
String(myScore8bit, radix: 2) // 2진수
String(myScore8bit, radix: 8) // 8진수
String(myScore8bit, radix: 10) // 10진수
// uppercase: true : 16진수에서 알파벳 대소문자
String(myScore32bit, radix: 16,uppercase: true) // 16진수
