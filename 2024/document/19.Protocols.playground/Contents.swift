import UIKit

/*
 프로토콜 (protocol) 은 메서드, 프로퍼티, 그리고 특정 작업이나 기능의 부분이 적합한 다른 요구사항의 청사진을 정의합니다.
 프로토콜은 요구사항의 구현을 제공하기 위해 클래스, 구조체, 또는 열거형에 의해 채택될 수 있습니다. 프로토콜의 요구사항에 충족하는 모든 타입은 프로토콜에 준수 (conform) 한다고 합니다.
 */

protocol UserInfo {
    var userName:String { get set }
    func presentAge() -> String
    var age:Int { get set }
}

class Member:UserInfo {
    var userName: String = ""
    var age: Int = 0
    func presentAge() -> String { age.description }
}

class Guest:UserInfo {
    var userName: String = ""
    var age: Int = 1
    func presentAge() -> String { age.description }
}

class User:UserInfo {
    var userName: String = ""
    var age: Int = 2
    var birtday = "2월3일"
    func presentAge() -> String { age.description }
}

class ReMember: Member { override func presentAge() -> String { age.description + "살" } }

let member = Member()
let guest = Guest()
let user = User()
let remember = ReMember()

// let users:[Any] = [member,guest,user,remember]
let users2:[UserInfo] = [member,guest,user,remember]



users2.forEach { user in
    if let user = user as? User {
        print(user.birtday)
    } else {
        print(user.age)
    }
    
}
