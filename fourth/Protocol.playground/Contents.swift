import UIKit

protocol UserInfo {
    var name: String { get set }
    var age: Int { get set }
    func presentAge() -> String
}

class Member:UserInfo {
    var name: String = "jeon"
    var age: Int = 30
    
    func presentAge() -> String {
        return name
    }
}


class Guest: UserInfo {
    var name: String = "kims"
    var age: Int = 28
    func presentAge() -> String {
        return name
    }
}


let member = Member()
let guest = Guest()

let allUser:[UserInfo] = [member, guest]

allUser.forEach { user in
    print(user.presentAge())
}
