import UIKit

protocol UserInfo {
    var name:String { get set }
    var age:Int { get set }
    func presentAge() -> String
}

class Member:UserInfo {
    var name = "jeonyul"
    var age = 30
    
    func presentAge() -> String {
        return age.description
    }
}

var member = Member()
member.presentAge()

// ---
protocol Togglabel {
    mutating func toggle()
}

enum OnOffSwitch:Togglabel {
    case on
    case off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}


var onoffswitch = OnOffSwitch.on
onoffswitch
onoffswitch.toggle()

// ---
protocol SomeProtocol {
    init(age:Int)
}

class members:SomeProtocol {
    var age = 1
    
    required init(age: Int) {
        self.age = age
    }
}

// ---
// delegation
enum AdultType {
    case adult, notAdult
}

protocol UserInfoDelegate {
    func isAdult(adultType: AdultType)
}

class UserA:UserInfoDelegate{
    func someFunc(){}
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
