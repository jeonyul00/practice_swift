import UIKit

// type castiong
// type conversion

// conversion : 타입이 완전히 재구성
var doubleNum:Double = 5.5

Double("str") // nil
Double(1) // 1
Int(doubleNum) // 5

// casting : 원본에 대한 개념을 그대로 가지고 있다.
class MainClass {
    
}

class Sub1:MainClass {
    var imSub = ""
}

var sub1 = Sub1()
sub1.imSub = "im sub"
sub1.imSub

// upCasting
var newMain = sub1 as MainClass // 타입이 바뀐다고 해서 원본의 형태가 바뀌지 않음
newMain

// downCasting
var reSub = newMain as? Sub1
reSub?.imSub // 살아있음

