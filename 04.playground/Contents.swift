import UIKit

// boolean
// js처럼 느슨하지 않다.

var a = 1
a
// x : Cannot assign value of type 'Bool' to type 'Int' : 할당 자체가 안됨
// a = true

// x : Binary operator '==' cannot be applied to operands of type 'Int' and 'Bool' : 검사 자체가 안됨
// a == true

var isTop = true
isTop == true
isTop == !true


// 값의 반대값으로 변경 : 원본 값 변경
isTop.toggle()
isTop

var str = "string"
let isTrue = str.isEmpty

let b = 2
a > b
!(a > b)


if isTop != str.isEmpty {
    print("if문 문법 왜이래")
}

if !(isTop != str.isEmpty) {
    print("if문 문법 왜이래")
}
