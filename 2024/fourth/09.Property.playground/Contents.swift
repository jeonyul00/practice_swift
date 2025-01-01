import UIKit

// 프로퍼티에 기능넣기 ex) 글자 입력 제한
// 이 기능을 여러군데에서 사용하고 싶다. -> @propertyWrapper, 호출할 때는 @{구조체명 || 클래스명}
@propertyWrapper
struct CharaterLimit {
    var count = 0
    var tempText = ""
    // 이 변수명으로 반드시 써야함
    var wrappedValue:String {
        get {
            return tempText
        } set {
            var text = newValue
            while text.count > count {
                text.removeLast()
            }
            tempText = text
        }
    }
    
    init(wrappedValue: String,count:Int) {
        self.wrappedValue = wrappedValue
        self.count = count
    }
}

// --

class Display {
    @CharaterLimit(count: 12) var name: String = ""
    @CharaterLimit(count: 8) var password:String = ""
}
