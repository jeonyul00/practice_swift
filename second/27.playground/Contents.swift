import UIKit

// 캡쳐링 밸류 -> 이거 뭐 메모리 관리 할 때 필요한 개념
// js에서는 참조타임, 원시타입 : swift에서는 참조(레퍼런스)타입, 값(밸류)타입
// swift에서의 reference type : class, function, closure
// swift에서의 value type : Int, String, Array, Dictionary, struct


var a = "a"
var b = a
b = "b"
a
b

class AnotherClass {
    var one = 1
}

// ---------------
class aa {
    var aaa = "aaa"
    var anotherClass = AnotherClass()
    
    // myFunc는 어디에 참조되지 않으니 사용 후 바로 내려감
    func myFunc(){
        print(aaa)
    }
        
    lazy var myClosure:(()->Void)? = {
        // x : aa클래스가 메모리에 올라갈 때 내부의 프로퍼티들이 동시에 만들어지는데 aaa가 아직 생성이 안된거지 => lazy 키워드 : 실제 접근할 때 생성하겠다.
        // print(self.aaa) // aa클래스를 참조하고 있음, aaa라는 값을 참조하고 있음
        print("클로저 내에서 어떠한 값을 참조하지 않으면 nil 안줘도 내려감? 왜? 어쨌든 클로저도 참조 타입이잖아") // ㅇㅇ 내려가짐... 언어가 참 섹시하네
    }
    
    // 값을 참조하지 않고 값으로서 복제 (밸류 타입만 가능) => 이러면 나중에 nil 안줘도 되겠군
    lazy var myClosure2 = {[aaa] ()->Void in print(aaa) }
    
    // 그럼 참조타입의 값을 값으로서 복제하고 싶으면? => weak : 약한 참조
    lazy var myClosure3 = {[weak anotherClass] ()->Void in print(anotherClass?.one ?? 1) }
    
    deinit {
        print("메모리에서 해제될 때 deinit 호출")
    }
}

var bb:aa? = aa()
var cc = bb
var dd = cc
dd?.aaa = "ddddddddddddd"
bb?.aaa
bb?.myClosure
bb?.myClosure2
bb?.myClosure3

// 여기까지는 다른 언어랑 같은 개념
// swift에서는 메모리 해제해야됨, 그런데 모든 참조된 카운트가 0이 되어야 해제가 됨, 위의 경우 bb,cc,dd 모두 해제되어야 메모리에서 내려감
// bb?.myClosure = nil

bb = nil
cc = nil
dd = nil

// 일반 캡쳐링은 참조타입으로 캡쳐하는군
