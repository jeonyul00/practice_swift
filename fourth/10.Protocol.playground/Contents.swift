import UIKit

protocol UserInfo {
    var name:String { get set } // get ,set 둘 다 쓰겠다.
    var age:Int { get set }
    func presentAge() -> String
}
class User: UserInfo {
    var name: String
    var age: Int
    
    var birthday = "2월 3일"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func presentAge() -> String {
        return age.description
    }
}
    
class Guest: UserInfo {
    var name: String
    
    var age: Int
    
    func presentAge() -> String {
        return age.description + "살"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Memeber: UserInfo {
    var name: String
    
    var age: Int
    
    
    
    func presentAge() -> String {
        return  "\(2024 - age)년 생"
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let member = Memeber(name: "멤버", age: 30)
let guest = Guest(name: "게스트", age: 30)
let user = User(name: "유저", age: 30)

let users:[UserInfo] = [member, guest, user]

users.forEach { info in
    if let user = info as? User {
        print(user.birthday)
    }
    print(info.presentAge())
}
