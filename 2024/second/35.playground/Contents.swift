import UIKit

// 프로퍼티 옵저버 : 프로퍼티가 변경되는걸 관찰
class StepCounter {
    // {} 안에다가 설정 가능
    var steps = 0 {
        // 값이 변경되기 전에 호출
        willSet {
            print("willSet : 현재값과 세팅하려는 값을 확인 할 수 있다 ::: ", steps, newValue)
        }
        // 값을 변경되면 호출
        didSet {
            print("didSet : 변경된 현재값과 변경되기 이전의 값을 확인 할 수 있다 ::: ", steps, oldValue)
        }
        
    }
}

var stepCounter = StepCounter()
stepCounter.steps = 1

// 저게 값 타입이니까 감지 할 수 있는거 아닌가? 참조 타입이면 메모리 위치가 변하는게 아니니까 안될거 같은데 => oo 안됨
class ClassA {
    var a = 0
}

class ClassB {
    var b = ClassA() {
        willSet {
            print("참조 타입 newValue ::: ", newValue)
        }
        didSet {
            print("참조타입 oldValue ::: " , oldValue)
        }
    }
}

var classB = ClassB()
classB.b.a = 0

