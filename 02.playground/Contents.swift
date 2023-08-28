import UIKit

// 초기값으로 타입 추론 : 타입 생략 가능
var myName = "jeonyul"
// type annotations
var myName2:String = "jeonyul"

var score1  = 40 // int
var score2:Int  = 40 // int
var score3:Double  = 40 // Double : 소수점 가능

score3 = 40.0
// x : Cannot assign value of type 'Double' to type 'Int's
// score2 = 40.0
