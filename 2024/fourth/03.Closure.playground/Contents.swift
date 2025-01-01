import UIKit

// 캡쳐링
// 레퍼런스 타입: class, func, closure
// 밸류 타입: Int, Array, Dictionary, struct

//  밸류 타입
struct MyStruct {
    var value = 1
}

var myStruct = MyStruct()
var myStruct2 = myStruct

myStruct.value = 2
// print(myStruct.value) // 2
// print(myStruct2.value) // 1

// ---

// 참조 타입
class MyClass {
    var value = 1
    
    // 중요: 클로저를 myClosure 변수가 참조하고 있으니까 이것도 메모리에서 내려야됨
    // 클로저 내부는 클로저 외부의 값을 "참조"한다.
    // 외부의 값을 접근만 해도 "참조"된다.
    lazy var myClosure:(()->Void)? = {
        print(self.value + 10)
    }
        
    // [] <- 이 안의 값을 복사한다. 참조 타입은 참조한다.
    // 이 myClosure2가 만들어지는 순간의 self를 복사한다. -> 복사 후에 self의 어떠한 값을 바꿔도 클로저 내부의 값은 값타입이기 때문에 관계x
    lazy var myClosure2:(()->Void)? = { [weak self] in
        print((self?.value)! + 100)
    }
    
    deinit { print("메모리 해제") }
}

var myClass:MyClass? = MyClass()
var myClass2 = myClass

myClass?.value = 2
print(myClass!.value) // 2
print(myClass2!.value) // 2


// 클래스 내부의 참조타입까지 다 내려야됨
// 호출을 안하고 접근만해도 메모리에서 안내려감
myClass?.myClosure
myClass?.myClosure = nil

// 근데 위의 방법대로 메모리 관리하면 너무 복잡하다. 실무에서는 클래스가 한 두개가 아닐텐데 -> 캡쳐리스트를 사용
myClass?.myClosure2!()

// 메모리에서 내리려면 모든 참조를 끊어야 MyClass가 메모리에서 내려감, 무조건 다 내려야됨
myClass = nil
myClass2 = nil
