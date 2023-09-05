import UIKit

// property observer : 변수의 값이 변경되는 걸 관찰함
// property에 값을 새로 설정할 때 감지해서 알려주는 개념
class StepCounter {
    // 이게 Int니까 감지 할 수 있다 => 참조형이면 감지x
    var steps = 0 {
        // willSet : 값을 세팅하기 직 전에 호출
        willSet {
            print("현재값 : ", steps)
            print("설정하려는 값 : ", newValue)
        }
        // didSet : 값을 넣자마자 호출
        didSet {
            print("이전 값 : ",oldValue) // 결론적으로 willSet의 newValue와 같은 값이겠지
            print("새로 설정된 값 : ",steps)
        }
    }
}


let stepCounter = StepCounter()
stepCounter.steps = 10
stepCounter.steps = 20
stepCounter.steps = 20


// ------ 참조형이면 감지x
class ClassA {
    var a = 0
}

class ClassB {
    var b = ClassA() {
        willSet {
            print("new value : ", newValue)
        }
        didSet {
            print("old value : ", oldValue)
        }
    }
}

let classB = ClassB()
classB.b.a = 100 // 자 이게 왜 안되냐?
// 위의 명령어가 안되는 이유는 : 결론적으로 바뀐 값은 ClassA의 a 변수이기 때문이지 => 오 그런 만약 저게 class가 아니고 struct라면?

struct StructA {
    var a = 0
}

class ClassC {
    var b = StructA() {
        willSet {
            print("new value : ", newValue)
        }
        didSet {
            print("old value : ", oldValue)
        }
    }
}
let classC = ClassC()
classC.b.a = 100 // 이러면 감지가 되지 왜냐면 밸류 타입이니까 흐름을 잘 파악하자 => 저 변수가 값을 가지고 있는지 주소를 가지고 있는지





