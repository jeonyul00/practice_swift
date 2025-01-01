import UIKit

// computed property (read only)
class MyProfile {
    var age = 20
    var isAdult:Bool { age > 19 ? true : false } // isAdult를 호출하면 뒤의 클로저가 실행 (get뿐이고, 1줄이면 return 생략)
    
    var isAdult2:Bool {
        get {
            // return age > 19 ? true : false
            tempIsAdult
        }
        set {
            tempIsAdult = newValue
        }
    }
    
    var tempIsAdult = false
}

var myProfile = MyProfile()

myProfile.isAdult
myProfile.age = 10
myProfile.isAdult


// ---

// property observer

class StepConter {
    var step = 0 {
        // 값이 바뀌기 직 전
        willSet {
            print("현재 값", self.step)
            print("설정하려는 값", newValue)
        }
        // 값이 바뀐 직 후
        didSet {
            print("설정 전의 값", oldValue)
            print("현재 값", self.step)
        }
    }
}

var stepConter = StepConter()
stepConter.step = 10

// 값이 참조 타입이면 감지 안되는거 아닌가?
class ClassA {
    var a = 0
}

class ClassB {
    var b = ClassA() {
        willSet {
            print(newValue)
        }
        didSet {
            print(oldValue)
        }
    }
}

var classB = ClassB()
classB.b.a = 1 // ㅇㅇ 감지 안됨 -> class를 struct로 하면 값타입이니까 될 듯

// ---

// property wrappers: 커스텀해서 사용함
@propertyWrapper
struct CharacterLimit {
    var count:Int = 0
    var tempString = ""
    // 반드시 wrappedValue로 정의해야함
    var wrappedValue: String {
        get {
            return tempString
        }
        set {
            var myText = newValue
            while myText.count > count {
                myText.removeLast()
            }
            tempString = myText
        }
    }
    
    init(wrappedValue: String, count:Int) {
        self.wrappedValue = wrappedValue
        self.count = count
    }
}

class Display {
    @CharacterLimit(count: 10) var name: String = ""
    @CharacterLimit(count: 12) var password: String = ""
}
var display = Display()
display.name = "12345678910"
print(display.name)
