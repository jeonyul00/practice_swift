import UIKit

/*
 closure에 대해 정리 해보겠다.
 closure : 익명 함수 쯤 된다. 사실은 Named Closure와 Unnamed Closure를 함쳐서 closure라고 부른다. 때문에 우리가 함수라고 부르는 것 역시 사실은 클로저(Named Closure)이다.
 그치만 그냥 함수로 부르는 것 뿐
 표현식
 { (parameters)->Return Type in 실행구문 }
 */
let myClosure = { (props:String)->Void in print("my Closure ::: ",props) }
myClosure("파라미터 명을 쓰지 않는다.")

// 위처럼 변수에 대입할 수 있으며, 함수의 파라미터로 전달도 가능
func exFunc(completion:()->Void) {
    print("ex func logic")
    completion()
}

exFunc(completion: { ()->Void in print("closure logic") })

// 함수의 반환 타입으로 클로저 사용 가능
func exFunc2()->()->() {
    return { ()->Void in print("test") }
}

// 클로저 직접 실행 : 이게 쓸 일이 있으려나 : 클로저를 소괄호로 감싸고 마지막에 호출 구문 () 추가
({ () -> Void in print("클로저 즉시 호출") })()

/*
 클로저 생략 문법
 Trailing Closure
 함수의 마지막 파라미터가 클로저일 때,
 이를 파라미터 값 형식이 아닌 함수 뒤에 붙여 작성하는 문법
 이때, Argument Label은 생략된다
 */

func exFunc3(completion:()->Void) {
    completion()
}

exFunc3(completion: { ()->Void in print("문법을 생략하지 않은 클로저") })
exFunc3() { ()->Void in print("문법을 조금 생략한 클로저")  }
exFunc3 { print("문법을 생략한 클로저")  }

// 파라미터가 클로저 여러개일 경우
func exFunc4(status: Int, success:()->Void, fail:()->Void){
    switch status {
    case 200:
        success()
    default:
        fail()
    }
}

exFunc4(status: 200) {
    print("success")
} fail: {
    print("fail")
}

// @autoclosure : 파라미터로 전달된 일반 구문 & 함수를 클로저로 래핑하는 것
func exFunc5(completion:@autoclosure ()->Bool){ // 실제 클로저를 전달받지 않지만, 클로저처럼 사용이 가능, 반드시 클로저의 파라미터가 없어야함
    completion()
}

exFunc5(completion: 1 > 2)

// @escaping : 함수 밖에서 클로저를 써야할 때
/*
    함수 내부에서 직접 실행하기 위해서만 사용한다
    따라서 파라미터로 받은 클로저를 변수나 상수에 대입할 수 없고,
    중첩 함수에서 클로저를 사용할 경우, 중첩함수를 리턴할 수 없다
    함수의 실행 흐름을 탈출하지 않아, 함수가 종료되기 전에 무조건 실행 되어야 한다
 
    함수 실행을 벗어나서 함수가 끝난 후에도 클로저를 실행하거나,
    중첩함수에서 실행 후 중첩 함수를 리턴하고 싶거나, 변수 상수에 대입하고 싶은 경우
 */
var escapingClosure:[()->Void] = []
func exFunc6(completion: @escaping () -> Void) {
    escapingClosure.append(completion)
}
 
// --- 메모리 관리
class AnotherClass {
    var one = 1
}

func doSomething() {
    var message = "Hi i am jeonyul!"
    var num = 10
    var anotherClass = AnotherClass()
    var num2 = 20
    
    /*
        closure란 익명함수는,
        클로저 내부에서 외부 변수인 num이라는 변수를 사용(print)하기 때문에
        num의 값을 클로저 내부적으로 저장하고 있는데,
        이것을 클로저에 의해 num의 값이 캡쳐 되었다 라고 표현함 => 캡쳐링의 기본값은 참조타입이다.
     */
    let closure = { print(num) }
    // 그런데 나는 참조 타입이 아니고 값 타입으로 캡쳐하고 싶다면? => 이 방식은 값타입의 값만 값 타입으로 캡쳐함
    // Closure를 선언할 당시의 num의 값을 Const Value Type으로 캡쳐함 -> 상수로 되겠네 -> 클로저 내부에서 재할당 불가
    let closure2 = { [num,num2] in print(num, num2) }
    
    
    // 참조타입 값을 값 타입으로 캡쳐하고 싶으면? : weak, unowned로 약한 참조로 만들면 됨
    ({[weak anotherClass] ()->Void in print(anotherClass?.one ?? 1) })()
    
    print(message)
    
}

doSomething()

// 다시
class Human {
   var name = ""
   
    // 얘 때문에 곱게 메모리 해제가 안됨 내부의 self.name은 결국 Human 클래스를 강한 참조하고 있기 때문에 이 참조를 끊어줘야함
    lazy var getName: () -> String? = {
        [weak self] in return self?.name
   }
   
   init(name: String) {
       self.name = name
   }

   deinit {
       print("메모리 해제!")
   }
}

var yul: Human? = .init(name: "전율")
print(yul!.getName()!)
yul = nil
