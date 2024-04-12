import UIKit

// 순환참조

class UserInfo {
    var name: String = ""
    weak var grade:Grade?
    
    deinit {
        print("메모리해제: UserInfo")
    }
}

class Grade {
    var year:Int = 0
    weak var userInfo:UserInfo?
    
    deinit {
        print("메모리해제: Grade")
    }
}

var user:UserInfo? = UserInfo() // user rc + 1
var grade:Grade? = Grade() // grade rc + 1

user?.grade = grade // grade rc + 1
grade?.userInfo = user // user rc + 1

// user?.grade = nil // grade - 1
// grade?.userInfo = nil // user rc - 1

user = nil // user rc - 1
grade = nil // grade rc - 1

