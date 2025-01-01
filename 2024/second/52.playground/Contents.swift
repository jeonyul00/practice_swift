import UIKit

// lazy
// class나 struct 안에서 property 변수(var)에 사용 가능

class AClass {
    var name = ""
    var age = 0
    // x : 클래스가 호출 될 때 (메모리에 올라갈 때 age와 같이 올라가는데 아직 age가 메모리에 안 올라간 상태에서 호출했기 때문에 오류)
    // var isAdult:Bool = age > 19 ? true : false

    // lazy : 이 변수에 접근 할 때 메모리에 올린다.
    lazy var isAdult:Bool = age > 19 ? true : false
    
    lazy var isAdult2: Bool = checkAge()
    
    func checkAge() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
    
    // 연산이 오래걸리고 인스턴스 생성 될 때도 필요없다면 성능 향상을 위해 lazy를 사용하기도 함
}



var aClass = AClass()
aClass.isAdult // false
aClass.isAdult2 // false

aClass.age = 20

aClass.isAdult // 왜 false냐? : lazy의 특징 : lazy 변수는 한 번 만들어지면 그 내용을 계속 확인하거나 연산하지 않음 (한 번 올라가면 메모리에 기억하고 있다.) useMemo 같은 기능 : 아니 그럼 어쩌라는거냐?
aClass.isAdult2 // false


// lazy sequence
let arr = Array(1...100)
let calcArr = arr.lazy.map{$0 * 10}

calcArr
calcArr
calcArr
// lazy : 접근할 때 생성된다 그렇기 때문에 현재는 생성되지 않았다
calcArr[50] // 접근 시 생성 : 이 부분만 생성됨 : 한 요소만 접근한다면 이게 훨 효율적이겠다.
// 다만 전체 요소에 접근해야하는 로직이 2개다? : lazy를 쓸 경우 길이 * 2만큼 접근하니까 이 부분은 잘 판단해서 써야겠다.
