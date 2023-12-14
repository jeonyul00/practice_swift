import UIKit

// conversion : 원본 데이터가 남아있지 않음, 완전히 재구성
var doubleNum:Double = 5.5
var value = Int(doubleNum) // 5 : 소수점을 제거 (누락)
Double(value) // 5 : 이 전에 이미 누락이 되었었기 때문에 다시 돌아갈 수 없다.

// casting : 원본의 형태를 가지고 있음
class MainClass {
    
}

class Sub1:MainClass {
    var imSub = ""
}

var sub1 = Sub1()
sub1.imSub = "test"

sub1.imSub // test
// type sub1 -> MainClass 업캐스팅
var newMain = sub1 as MainClass
