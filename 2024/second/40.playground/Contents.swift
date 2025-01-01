import UIKit

protocol Togglabel {
    mutating func toggle()
}

enum OnOffSwitch:Togglabel {
    
    case on
    case off
    
    mutating func toggle() {
        if self == .on {
            self = .off
        }
        if self == .off {
            self = .on
        }
        
    }
}

var onOffswitch = OnOffSwitch.off
onOffswitch.toggle()


protocol SomeProtocol {
    init(age:Int)
}

class VIPMember:SomeProtocol {
    var age:Int
    
    required init(age: Int) {
        self.age = age
    }
}

var vip = VIPMember(age: 20)
vip.age

// ---
enum AdultType {
    case adult
    case notAdult
}

// delegation : 위임 => 어떤 값을 다른곳으로 위임
protocol UserInfoDelegate:AnyObject {
    func isAdult(adultType:AdultType)
}

class UserA:UserInfoDelegate {
    func someFunc(){
        
    }
    
    func isAdult(adultType: AdultType) {
        print(adultType)
    }
    deinit {
        print("메모리 해제")
    }
    
}

class TypeChecker {
    weak var delegate: UserInfoDelegate?
    
    func checkDone(){
        delegate?.isAdult(adultType: .adult)
    }
}

var userA:UserA? = UserA()
var typeChecker = TypeChecker()

typeChecker.delegate = userA // isAdult만 연결됨
typeChecker.checkDone() // delegate 호출

userA = nil


