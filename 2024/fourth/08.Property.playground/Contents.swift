import UIKit

// 프로퍼티옵저버: 변수의 값이 변경되는걸 관찰하여 감지
class StepCounter {
    var steps = 0 {
        // 세팅 할 것이다. (아직 안됨)
        willSet {
            print("현재 값 : ", self.steps)
            print("들어올 값 : ", newValue)
        }
        // 세팅했다. (됨)
        didSet {
            print("현재 값 : ", self.steps)
            print("들어온 값 : ", oldValue)
        }
    }
}

let stepCounter = StepCounter()

stepCounter.steps = 10
stepCounter.steps = 10
stepCounter.steps = 10
stepCounter.steps = 10
// 재할당 할 때마다 호출됨
// 그리고, 값 타입만 감지함 <- 이론적으로 당연하지 참조타입은 변수가 메모리 주소를 가지고 있는데 주소가 변하지는 않을테니

class ClassA {
    var a = 0
}

class ClassB {
    var b = ClassA() {
        willSet {
            print("현재 값 : ", self.b)
            print("들어올 값 : ", newValue)
        }
        // 세팅했다. (됨)
        didSet {
            print("현재 값 : ", self.b)
            print("들어온 값 : ", oldValue)
        }
    }
}


let classB = ClassB()

classB.b.a = 1 // 작동 안 함 당연하지, 구조체로하면 될 듯
