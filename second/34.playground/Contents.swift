import UIKit

// property : 어딘가에 속해 있는 변수
class MyClass {
    var name = ""
}

struct MyStruct {
    var name = ""
}

var myClass = MyClass()
var myStruct = MyStruct()

myClass.name = "kim"
myClass.name
myStruct.name = "kim"
myStruct.name

// 여기까지는 둘 다 동작 방식이 같다 그럼 저 인스턴스를 let으로 한다면?
// class는 레퍼런스 타입 , struct는 밸류 타입 => class는 원본의 변수가 var라면 참조 할 때 var이기 때문에 변경이 가능, struct의 경우 값을 복사하기 떄문에 myStruct2에 값이 직접 있는거다. 그러므로 myStruct2이 let이라면 값을 변경 할 수 없다.
let myClass2 = MyClass()
let myStruct2 = MyStruct()

myClass2.name = "kim"
myClass2.name
// x
// myStruct2.name = "kim"
myStruct2.name

// lazy stored property (지연된 저장된 어딘가에 속한 변수)
class MyClass3 {
    lazy var name = "test" // 메모리에 올리는 순간이 아니고, 변수에 접근 할 때 생성됨
    var age = 20
    // var isAdult = age > 19 ? true : false 아직 age가 생성되지 않았기 때문에 접근을 못하지 => lazy
    lazy var isAdult = age > 19 ? true : false
    lazy var names = ["kim","jeon"]
    lazy var nameCount = names.count
    
    func nameCount2() -> Int {
        return names.count
    }
}

var myClass3 = MyClass3() // lazy 키워드가 붙은 프로퍼티는 생성이 안됨
myClass3.name // 지금 생성됨, 지금 접근했으니까, 이딴걸 언제쓰냐? 한번에 메모리에 너무 많은 값을 올리면 잠깐 끊김 => 고도화를 위해, 같은 레벨의 변수에 접근하여 값을 정해야 할 때


// ---------- 여기서부터 좀 헷갈림 ----------
myClass3.nameCount // 2
myClass3.names.append("lee")
myClass3.names.append("park")
myClass3.nameCount // 2 : 시발 왜? : 접근 할 때 생성 될 뿐이지 처음 만들어진 결과값은 메모리에 기억하고 있다. => 계속 리렌더링 되는게 아님 => 그럼 어떻게 해결하냐 => 1. func, 2. computed property
myClass3.nameCount2() // 함수는 호출 했을 때 실행됨

// computed property : func과 유사한 프로퍼티
class myProfile {
    var age = 20
    // computed property
    // type 무조건 써야됨, read only
    var isAdult:Bool {
        age > 19 ? true : false
    }
    // 난 read only이고 싶지 않다면? 사실 위의 computed는 생략형 문법이다.
    // lazy 사용 불가
    var isAdult3:Bool {
        get{
            return tempIsAdult
        }
        set{
            // newValue : 인스턴스에서 새로 set한 값
            return tempIsAdult = newValue
        }
    }
    
     var tempIsAdult = false // 임시 저장 공간
}

// 한 번 더
class ExClass {
    var tempInt = 0
    var myCustomInt:Int {
        get{
            if tempInt > 0 && tempInt <= 10 {
                return tempInt
            }
            return 0
        }
        set{
            tempInt = newValue
        }
    }
}

var exClass = ExClass()
exClass.tempInt = 15
exClass.myCustomInt
exClass.tempInt = 5
exClass.myCustomInt
