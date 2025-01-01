import UIKit

/*
    type
 */

var name = "yul"
// ts는 여기서 "yul" 타입인데, swift에서는 String 타입 => 타입 추론이 ts랑은 다른 방식으로 됨 : 이게 더 나을지도
type(of: name) // String

// x : Cannot assign to value: literals are not mutable
// var name2:"yul" = "yul"

var name2:String = "yul"
type(of: name2)

// x : Cannot assign to value: literals are not mutable
// let num:1=1

var num:Double = 1
var num2:Int = 1

num = 1.0
// x : Cannot assign value of type 'Double' to type 'Int'
// num2 = 1.0
