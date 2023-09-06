import UIKit

// protocol2

protocol Togglabel {
    mutating func toggle()
}


enum OnOffSwitch: Togglabel {
    case on
    case off
    
    // mutating : 밸류, 참조 문제
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var onOffSwitch = OnOffSwitch.off
onOffSwitch
onOffSwitch.toggle()


// 반드시 초기값을 선언해야 할 경우
protocol SomeProtocol {
    init(age:Int)
}


class VIPMember:SomeProtocol {
    var age:Int
    
    required init(age: Int) {
        self.age = age
    }
        
}

var vip = VIPMember(age: 30)
vip.age

// ---------- 이게 무슨 말이지? : 다시 뜯어보기
// Delegation : 위임한다?, 데이터를 넘겨주는 기법 중 하나
enum AdultType {
    case adult
    case notAdult
}

protocol UserInfoDelegate {
    func isAdult(adultType:AdultType)
}

class UserA:UserInfoDelegate {
    // 내용을 구현하지 않고 값을 받아옴
    func isAdult(adultType: AdultType) {
        print(adultType)
    }
}

class TypeChecker {
    var delegate:UserInfoDelegate?
    
    func checkDone(){
        delegate?.isAdult(adultType: .adult)
    }
}

let userA = UserA()
let typeChecker = TypeChecker()
typeChecker.delegate = userA
typeChecker.checkDone()
