import UIKit

class MyClass {
    var name:String?
}

struct MyStruct {
    var name:String?
}


let myClass = MyClass()
let myStruct = MyStruct()

myClass.name = "jeonyul" // ㅇ -> 참조하는 값이 var이기 때문에 재할당 가능
// myStruct.name = "jeonyul" // x -> 값타입이라서 myStruct이 let으로 선언되면 재할당이 안되지 -> 전부 var로 선언하면 바꿀 수 있지

// 지연된 프로퍼티
class MyClass2 {
    var name = ""
    var age = 20
    lazy var isAudlt = age > 19 ? true : false // isAudlt와 age는 동시에 만들어지기 때문에 self에 접근할 수 없지 -> lazy로 지연시키면 됨
    lazy var names = ["예를들어", "이게 요소가 10000개인 배열이라면", "초기화 할 때 느리겠지", "그럴 때에 lazy"]
    lazy var nameCount = names.count
    
    func funcNameCount() -> Int {
        return names.count
    }
}


var myClass2 = MyClass2()
myClass2.nameCount // 4
myClass2.names.append("접근하는 지금 생성됨")
myClass2.nameCount // 4 -> 왜? -> 최초 접근한 값을 메모리에 기억해 둘 뿐이다. 그래서 안바뀜
myClass2.funcNameCount() // 5

myClass2.isAudlt // true
myClass2.age = 10
myClass2.isAudlt // true 아... -> 그럼 어떻게 해결하느냐? -> func 또는 컴퓨티드 프로퍼티

// 컴퓨티드 프로퍼티: 타입 추론이 안되어서 반.드.시 명시, read only
class MyProfile {
    var age = 20
    // 호출될 때 마다 { } 안의 로직을 실행한다.
    var isAdult:Bool {
        get {
            return age > 19 ? true : false
        }
    }
    var isAdult2:Bool {
        age > 19 ? true : false
    }
    var isAdult3:Bool {
        get {
            // age > 19 ? true : false
            tempIsAdult
        } set {
            // 여기 리드온리라서 직접은 못넣음, 임시값 저장할 변수 필요
            tempIsAdult = newValue
        }
    }
    var tempIsAdult = false
}

let myProfile = MyProfile()

myProfile.age = 10
myProfile.isAdult
myProfile.age = 20
myProfile.isAdult
