import UIKit

/* Closure란 내부 함수와 내부 함수에 영향을 미치는 주변 환경을 모두 포함한 객체이다. */


func doSomething() {
    var message = "test message"
    // --- 클로저 범위 시작 ---
        var num = 10
    /*
     closureTest란 익명함수는,
     클로저 내부에서 외부 변수인 num이라는 변수를 사용(print)하기 때문에
     num의 값을 클로저 내부적으로 저장하고 있는데,
     이것을 클로저에 의해 num의 값이 캡쳐 되었다 라고 표현함
     message란 변수는 클로저 내부에서 사용하지 않기 때문에
     클로저에 의해 값이 캡쳐되지 않음!
    */
    // Closure는 값을 캡쳐할 때 Value/Reference 타입에 관계 없이 Reference Capture 한다 => 저 값이 뭐든 상관없이 무.조.건.참.조 한다.
    // 그럼 만약 나는 Value Type으로 Capture를 하고 싶으면 어떻게 할까? : closureTest2로 구현하겠다.
        let closureTest = { print(num) }
    
    // 클로저의 시작인 { 의 바로 옆에  []를 이용해 캡쳐할 멤버를 나열한다 이때 in 키워드도 꼭 함께 작성한다, 주의 할 점은 closure를 선언할 당시의 num값을 상수로 캡쳐한다. only Read
    // 또한 [] 안의 값은 value type이어야한 한다. 참조타입을 넣는다고해서 value 타입이 되는 건 아니다
        let closureTest2 = { [num] in print(num) }


    // --- 클로저 범위 끝 ---
    print(message)
}


// --- 클로저와 인스턴스의 관계
class Human {
    var name:String = ""
    
    lazy var getName: () -> String = { [weak self] in return self?.name ?? "" }
    
    init(name: String) {
        self.name = name
    }
 
    deinit {
        print("Human Deinit!")
    }
}

var jeonyul: Human? = .init(name: "jeonyul")
print(jeonyul!.getName())

// 이제 더 이상 jeonyul이라는 인스턴스가 필요없다. -> 메모리에서 내려야함
jeonyul = nil // 하지만 deinit이 호출되지 않음 -> 클로저는 참조 타입으로, Heap 메모리에 생성되어 있음, getName을 호출하는 순간 (lazy 때문에 호출하는 순간 메모리에 올라감)
// 근데, getName이란 클로저를 보면  self를 통해 Human이란 인스턴스의 프로퍼티에 접근하고 있음 -> 클로저는 Reference 값을 캡쳐할 때 기본적으로 강한 참조로 캡쳐를 함 -> uman이란 인스턴스의 Reference Count가 증가

/* 요약
 Human 인스턴스는 클로저를 참조하고,
 클로저는 Human 인스턴스(의 변수)를 참조하기 때문에
 서로가 서로를 참조하고 있어서
 둘 다 메모리에서 해제되지 않는 강한 순환 참조가 발생해 버린 것임!
 그럼 어떻게 할까?
 ARC에서 배웠지만, 강한 순환참조는 weak, unowned를 통해
 해결할 수 있다
 lazy var getName: () -> String? = { [weak self] in
      return self?.name
  }
 
 또는
 저 클로저도 nil을 주면 됨
 */








