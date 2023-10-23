import UIKit

// 연산자

var (age1, age2) = (10, 20)
age1 + age2
age1 - age2
age1 * age2
age1 / age2

var (str1, str2) = ("hello", "world")
str1 + str2

var arr = ["a","b","c"]
var arr2 = ["d","e","f"]
arr + arr2 // 같은 타입의 경우 가능

// remainder : 나머지
age1 % age2

var DoubleNumber:Double = 8
var DoubleNumber2:Double = 3

// double의 경우
DoubleNumber.truncatingRemainder(dividingBy: DoubleNumber2)
