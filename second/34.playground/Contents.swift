import UIKit

// property

var name = ""

class MyClass {
    var name = ""
}

struct MyStruct {
    var name = ""
}

let myClass = MyClass()
// MyClass를 참조하고 그 안의 프로퍼티 name이 var이기 때문에 가능
myClass.name = "kim"
myClass.name

let myStruct = MyStruct()
// x : MyStruct가 값 타입이기 때문에 프로퍼티가 let이든 var이든 안됨
// myStruct.name = "jeon"
myStruct.name

// lazy property : 이거 프로퍼티를 호출 했을 때에 메모리에 올라가는거였나
// 프로퍼티가 너무 많은 상태에서 인스턴스를 만들면 메모리 과부하가 걸릴 수 있다 => 이럴 때에 효율 때문에도 쓸 수 있다.
class MyClass2 {
    lazy var name = ""
    var age = 20
    
    // x : age와 동시에 만들어지기 때문에 아직 age가 없다 => 접근 할 수 없다
    // var isAudlt = age > 19 ? true : false
    
     lazy var isAudlt = age > 19 ? true : false // lazy : 실제 접근 할 때 메모리에 올라감
    
    var names = ["jeon", "kim"]
    lazy var nameCount = names.count
    
    func nameCount2()->Int{
        return names.count
    }
}

var myClass2 = MyClass2()
myClass2.nameCount // 2

myClass2.names.append("choi")
myClass2.nameCount // 2 => 아니 왜? => 프로퍼티 nameCount가 처음 메모리에 올라갈 때의 값을 기억하고 있다. 호출 시 마다 확인하는게 아님

// 그러면 age바꿔도 isAudlt의 값은 안변하겠네?
myClass2.isAudlt // 처음 프로퍼티가 메모리에 올라간 값을 기억 true
myClass2.age = 10
myClass2.isAudlt // true

// 프로퍼티만
// 그럼 어떻게 하냐? => func 또는 computed property
myClass2.nameCount2() // 얘는 잘 나오지, 함수를 호출 했을 때 로직이 계속 실행

class MyProfile {
    var age = 20
    // computed property
    // isAdilt를 호출할 때 마다 로직을 실행한다. => 약간 클로저 같네 : read only
    // 이거 문법 생략한거 => 생략 안한건 isAdilt2
    var isAdilt:Bool {
        return age > 19 ? true : false
    }
    
    var isAdilt2:Bool {
        get{
            return age > 19 ? true : false
        }
    }
    
    var tempIsAdult = false
    var isAdilt3:Bool {
        get {
            return age > 19 ? true : false
        }
        set {
            // newValue : isAdilt3에 새로 들어온값(할당된 값)
            tempIsAdult = newValue
        }
    }
    
}

var myProfile = MyProfile()
myProfile.isAdilt // true
myProfile.age = 10
myProfile.isAdilt // false
