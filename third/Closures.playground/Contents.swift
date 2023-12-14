import UIKit

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

makeIncrementer(forIncrement: 1)()

var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}


class exSomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}


let instance = exSomeClass()
instance.doSomething()
// print(instance.x)
// Prints "200"


completionHandlers.first?()
// print(instance.x)
// Prints "100"

// 메모리 해제

class SomeClass {
    var num = 1
    
    func someFunc() -> Void {
        print("someFunc")
    }
    
    deinit {
//        print("메모리 해제")
    }
    
}

var myClass:SomeClass? = SomeClass()
var myClass2 = myClass
var myClass3 = myClass2
var myClass4 = myClass3

myClass = nil // 다른 변수들의 참조 모두 끊어줘야 메모리 해제가됨, 이 라인에서는 아직 해제가 안됨
myClass2 = nil
myClass3 = nil
myClass4 = nil // 이 라인에서 메모리 해제

// --- 캡쳐링
class SomeClass2 {
    var num = 1
    
    func someFunc() -> Void {
        print("someFunc")
    }
    
    // 클로저는 참조 타입, 클로저에서는 명시적으로 self를 써야함(캡쳐를 하기 때문에, 참조하기 때문에)
    // self -> 그러니까 이 클로저는 SomeClass2 (self)를 참조하고 있음, self.num만 사용한거지 참조 자체는 self 전부
    lazy var myClosure:(()->Void)? = { print(self.num) }
    
    deinit {
//        print("메모리 해제")
    }
    
}

var myClasss: SomeClass2? = SomeClass2()
var myClasss2 = myClasss
var myClasss3 = myClasss2
var myClasss4 = myClasss3

myClasss?.myClosure
myClasss?.myClosure = nil // 와 이걸 또 인스턴스보다 먼저 참조를 끊어야하네;; 하긴 이론 상 그게 맞기는 하지..

myClasss = nil
myClasss2 = nil
myClasss3 = nil
myClasss4 = nil


// 캡쳐리스트 : 캡쳐링하면 참조가 되는데, 매 번 메모리 해제하는게 비효율적이다. -> self 값 자체를 값 타입으로 가져올 수 있다. (가져왔을 당시의 self값을 기억한다. -> 추 후 바껴도 캡쳐된 값은 안 바뀜)
class ExClass {
    var num = 2
    var someClass = SomeClass()
    
    lazy var myClosure:(()->Void)? = { print(self.num) }
    lazy var myClosure2:(()->Void)? = { [num] () -> Void in print(self.num) } // myClosure2가 만들어지는 순간(여기서는 호출되는 순간) num 값을 복사함(참조x)
    
    // 만약 캡쳐링하는 값이 참조형인 경우에는? => 이러면 또 참조형으로 가져옴 => 그러면? => 약한 참조 weak (참조타입만 사용가능) => 옵셔널로 되는건가?
    // 약한 참조: 래퍼런스 카운트가 증가하지 않음
    lazy var myClosure3:(()->Void)? = { [weak self] () -> Void in print(self?.num ?? 0) }
    
    deinit { print("메모리 해제") }
}

var myExClass: ExClass? = ExClass()
var myExClass2 = myExClass
var myExClass3 = myExClass2
var myExClass4 = myExClass3

// escaping: 함수에서 함수 밖으로 클로저가 실행될 수 있다.
var myClosureLIst = [() -> Void]()

func showString(completion: @escaping ()->Void) {
    print("func")
    // completion이 함수 내부에서 실행되는게 아니고 함수 밖의 변수에 들어가니까(나중에 실행되겠지) escaping
    myClosureLIst.append(completion)
}

showString {
    print("escaping closure")
}

myClosureLIst.forEach { completion in
    completion()
}


