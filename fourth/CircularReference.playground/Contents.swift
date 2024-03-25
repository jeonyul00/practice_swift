import UIKit

// 순환 참조: 서로가 서로를 참조
class UserInfo {
    var name:String?
    var grade:Grade?
    
    deinit {
        print("UseInfo 메모리 해제")
    }
}

class Grade {
    var year: Int?
    var userInfo: UserInfo?
    
    deinit {
        print("Grade 메모리 해제")
    }
}

var user:UserInfo? = UserInfo() // 유저 카운트 +1
var grade:Grade? = Grade() // 학년 카운트 +1

user?.grade = grade // 학년 카운트 +1
grade?.userInfo = user // 유저 카운트 +1

// 모든 순환 참조 다 끊으면 메모리에서 내려가기는 함, 근데 이걸 어느 세월에 다 할 것이며, 안 헷갈릴 수 있겠는가? -> 그럼 어쩌라는거냐? => weak || unownd 명시
// user?.grade = nil
// grade?.userInfo = nil
user = nil // 유저 카운트 -1
grade = nil // 학년 카운트 -1
