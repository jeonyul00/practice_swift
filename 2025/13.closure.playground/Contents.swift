import UIKit

func plus(_ num: Int, _ num2: Int) -> Int {
    return num + num2
}

// 클로저
let plusClosure = { (a: Int, b: Int) -> Int in return a + b }

let value = plusClosure(1,2)
value

// ---
func callBackClosure(_ a: Int, colpletion: ()->Int) -> Int {
    print("a ::: ",a)
    let sum = a + colpletion()
    return sum
}


func f1(_  completion: (String) -> Void){
    print("작업 시작")
    print("작업 중")
    completion("작업")
}


f1 { str in print(str + " 끝")}

// ---
let str: String = "str"
let str2 = str
let str3 = str2

str == str3 // true -> 값 타입이기 때문에

// 참조 타입 (class function, closure)
class ReferanceType {
    var a = 10
    
    // 얘도 메모리에서 내려줘야함
    lazy var myClosure:(()->Void)? = {
        // 클로저 내부에서 self를 써야하는 이유 -> 클로저 내부에서는 캡쳐(참조)를 하기 때문에
        print(self.a)
    }
    
    // 캡쳐 리스트
    /*
     [어떤값] -> 어떤 값을 캡쳐하겠다는 것을 명시 (값 타입은 복사되어 저장되고, 참조 타입은 강한 참조로 저장됨)
     [weak 어떤값] -> 어떤 값을 약한 참조로 캡쳐하겠다는 것을 명시 (참조 타입의 강한 순환 참조를 방지하기 위해 사용)
     */
    lazy var myClosure2: (() -> Void)? = { [weak self] in
        guard let self else { return }
        print(self.a)
    }
    deinit {
        print("메모리 해제")
    }
}

var a:ReferanceType? = ReferanceType()
a?.a = 20
var b = a
b?.a // 20 -> 참조 타입이니까 하나를 바라보고 있는거지 깊복 얕복 개념임
// 메모리에서 내리려면 참조를 다 끊어야함.
a?.myClosure?() // 이거 호출하면 메모리에 올라감 (lazy) 그럼 메모리에서 내려줘야 함
a?.myClosure = nil // 근데 매 번 이런식이면 너무 귀찮고, 헷갈림 -> 약한 참조법이 있음 (레퍼런스로 캡쳐라는게 아니고 값 타입으로 캡쳐하는 방법) == 값을 복제하는 형태 예시) myClosure2
b = nil
a = nil

// ========================
// 클로저를 함수 밖에서 쓸 수 있도록
var myClosure3:[()->Void] = []
@MainActor func solution(_ completion: @escaping () -> Void){
    myClosure3.append(completion)
}

solution {
    print(1)
}
solution {
    print(2)
}
solution {
    print(3)
}

myClosure3.forEach { completion in
    completion()
}

