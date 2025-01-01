import UIKit

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
print(reversedNames)

// 캡처값 (Capturing Values)
// 클로저는 정의된 둘러싸인 컨텍스트에서 상수와 변수를 캡처 (capture) 할 수 있습니다. 그러면 클로저는 상수와 변수를 정의한 원래 범위가 더이상 존재하지 않더라도 본문 내에서 해당 상수와 변수의 값을 참조하고 수정할 수 있습니다.
// 아래는 incrementer 라는 중첩 함수가 포함된 makeIncrementer 라는 함수의 예입니다. 중첩된 incrementer() 함수는 둘러싸인 컨텍스트에 runningTotal 과 amount 인 2개의 값을 캡처합니다. 이 값을 캡처한 후에 incrementer 는 호출될 때마다 amount 로 runningTotal 을 증가시키는 클로저로 makeIncrementer 에 의해 반환됩니다.
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
// incrementer() 함수는 파라미터가 없으며 함수 본문 내에 runningTotal 과 amount 를 참조하고 있습니다. 둘러싸인 함수에 runningTotal 과 amount 대한 참조 (reference) 를 캡처하고 함수 내에서 사용합니다. 참조를 캡처하는 것은 makeIncrementer 호출이 종료될 때 runningTotal 과 amount 가 사라지지 않고 다음에 incrementer 함수가 호출될 때 runningTotal 을 사용할 수 있습니다.
let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen()) // 10
print(incrementByTen()) // 20
print(incrementByTen()) // 30
let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven()) // 7

// 클로저는 참조 타입 (Closures Are Reference Types)
// 위 예제에서 incrementBySeven 과 incrementByTen 은 상수이지만 이러한 상수가 참조하는 클로저는 캡처한 runningTotal 변수를 계속 증가시킬 수 있습니다. 이는 함수와 클로저가 참조 타입 (reference types) 이기 때문입니다.

// 탈출 클로저
// 함수에 인수로 클로저를 전달하지만 함수가 반환된 후 호출되는 클로저를 함수를 탈출 (escape) 하다 라고 말합니다. 클로저를 파라미터로 갖는 함수를 선언할 때 이 클로저는 탈출을 허락한다는 의미로 파라미터의 타입 전에 @escaping 을 작성할 수 있습니다.
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

// self 를 참조하는 이스케이프 클로저는 self 가 클래스의 인스턴스를 참조하는 경우 특별한 고려가 필요합니다. 이스케이프 클로저에 self 캡처는 강한 참조 사이클이 생기기 쉽습니다.
// 일반적으로 클로저는 클로저 내부에서 변수를 사용하여 암시적으로 변수를 캡처하지만 이 경우에는 명시적이어야 합니다. self 를 캡처하려면 사용할 때 명시적으로 self 를 작성하거나 클로저의 캡처 리스트에 self 를 포함합니다. self 를 명시적으로 작성하는데 의도를 표현하고 참조 사이클이 없음을 확인하도록 상기시켜 줍니다.


// todo 클로저 구문 다시 공부
