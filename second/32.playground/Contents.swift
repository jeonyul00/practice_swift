import UIKit

// deinit
// 초기화 해제

class Test {
    
    init() {
        print("init")
    }
    
    deinit {
        print("deinit : 이 클래스가 메모리에서 해제되었을 때 호출")
        // 해제 시 필요한 로직
    }
}

// 참조 카운트가 0이 되었을 때 메모리에서 해제가 됨
var test:Test? = Test()
var test2 = test
var test3 = test2

test = nil
test2 = nil
test3 = nil

// 이게 더 편할 듯
class MyClass {
    var test:Test? = Test()
    lazy var test2 = test
    lazy var test3 = test2
    
    deinit {
        print("deinit : 이 클래스가 메모리에서 해제되었을 때 호출222")
    }
}

var myClass: MyClass? = MyClass()
myClass = nil


// 
