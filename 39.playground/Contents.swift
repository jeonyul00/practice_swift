import UIKit

// protocol : 규칙, 뼈대, 규격
protocol UserInfo {
    var userName:String { get set }
    var age: Int { get set }
    // 바디 없어야됨
    // / 3개면 호출하는 부분에서 option 눌렀을 때 Summary에 주석 나옴
    /// 나이를 문자열로 반환
    func presentAge() -> String
}

// 반드시 구현해야 함
class Member:UserInfo {
    
    var userName: String = ""
    
    var age: Int  = 10
    
    func presentAge() -> String {
        age.description + "살"
    }

}

class Guest:UserInfo {
    var userName: String = ""
    
    var age: Int = 20
            
    func presentAge() -> String {
        age.description
    }
    
}

class User:UserInfo {
    var userName: String = "세"
    
    var age: Int = 30
    
    var addValue:String = "add element"
    
    func presentAge() -> String {
        age.description + "살이다."
    }
}

// 오 변수명을 통일 할 수 있네

let member = Member()
let guest = Guest()
let user = User()

// 이걸 배열에 넣으려면 타입을 any가 아니고 protocol로 받으면 되겠지? , 이런 것도 되네;
let users:[UserInfo] = [member, guest, user]

users.forEach { UserInfo in
    print((UserInfo as? User)?.addValue)
    print(UserInfo.presentAge())
}

