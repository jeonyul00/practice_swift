import UIKit

// enum을 활용한 프로토콜
protocol Togglabel {
    mutating func toggle()
}

/*
 mutating 키워드는 Swift에서 값 타입(Value Type)인 struct나 enum 내에서 자신의 속성 값을 변경할 때 사용됩니다.
 값 타입은 기본적으로 불변(immutable)이라서, 그 속성 값을 변경하려면 mutating 키워드를 사용해야 합니다.
 쉽게 말해, mutating 키워드는 메서드가 그 값 타입의 인스턴스 자체를 변경할 수 있음을 나타냅니다.
 만약 mutating 키워드를 사용하지 않으면, 값 타입 내에서 인스턴스의 속성 값을 변경하려고 할 때 컴파일 오류가 발생합니다.
 */
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

var onOffSwitch = OnOffSwitch.off
onOffSwitch.toggle()
onOffSwitch
onOffSwitch.toggle()
onOffSwitch

// --
protocol SomeProtocol {
    init(age:Int)
}

class VIPMember:SomeProtocol {
    var age: Int
    required init(age: Int) {
        self.age = age
    }
}


// --
enum AdultType {
    case adult
    case notAdult
}
// Delegation Pattern
protocol UserInfoDelegate:AnyObject {
    func isAdult(adultType: AdultType)
}

// 'weak' must not be applied to non-class-bound 'any UserInfoDelegate'; consider adding a protocol conformance that has a class bound: protocol에서 AnyObject 확장
class TypeChecker {
    weak var delegate: UserInfoDelegate?
    func checkDone(){
        delegate?.isAdult(adultType: .adult)
    }
}

class UserA:UserInfoDelegate {
    func SomeFunc() {
        
    }
    
    func isAdult(adultType: AdultType) {
            print(adultType)
    }
    
    deinit { print("메모리 해제") }
}

let userA = UserA()
let typeChecker = TypeChecker()

typeChecker.delegate = userA
typeChecker.checkDone()

// -- 델리게이트 패턴 다시
enum Question {
    case favoriteSubject
    case age
}

protocol StudentDelegate: AnyObject {
    func answerQuestion(question: Question)
}

class Teacher {
    weak var delegate: StudentDelegate?
    
    func askQuestion() {
        delegate?.answerQuestion(question: .favoriteSubject)
    }
}

class Student: StudentDelegate {
    func answerQuestion(question: Question) {
        switch question {
        case .favoriteSubject:
            print("My favorite subject is Math.")
        case .age:
            print("I am 16 years old.")
        }
    }
    
    deinit {
        print("Student object is being deallocated")
    }
}

let student = Student()
let teacher = Teacher()

teacher.delegate = student
teacher.askQuestion() // "My favorite subject is Math." 출력
