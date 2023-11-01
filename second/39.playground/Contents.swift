import UIKit

// protocol : 뼈대, 규격, 규칙 : 약간 자바의 인터페이스 같네
protocol UserInfo {
    var userName:String { get set }
    var age:Int { get set }
    func presentAge() -> String
}

class Member:UserInfo {
    var age: Int
    var userName: String
    
    func presentAge() -> String {
        return age.description
    }
    
    init(age: Int, userName: String) {
        self.age = age
        self.userName = userName
    }
}

class Guest: UserInfo {
    var age: Int
    var userName: String
    
    func presentAge() -> String {
        return age.description + "살"
    }
    
    init(age: Int, userName: String) {
        self.age = age
        self.userName = userName
    }
}

class User: UserInfo {
    var age: Int
    var userName: String
    
    var birthday = "2월 3일"
    
    func presentAge() -> String {
        return age.description + "세"
    }
    
    init(age: Int, userName: String) {
        self.age = age
        self.userName = userName
    }
}

// 이랬을 때의 장점
let memeber = Member(age: 30, userName: "jeon")
let guest = Guest(age: 28, userName: "kim")
let user = User(age: 25, userName: "lee")

memeber // type Member
guest // type Guest
user // type User

// 타입 통일이 됨
let users: [UserInfo] = [memeber, guest, user]


users.forEach { UserInfo in
    print((UserInfo as? User)?.birthday ?? "")
    print(UserInfo)
    
}



