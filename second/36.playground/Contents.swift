import UIKit

// property wrappers : 프로퍼티에 기능을 넣는다

// ex) 글자 입력 제한
@propertyWrapper
struct CharacterLimit{
    var count = 0
    var tempText = ""
    // 반드시 wrappedValue라고 써야함
    var wrappedValue:String{
        get {
            return tempText
        }
        set {
            var myText = newValue
            while myText.count > count {
                myText.removeLast()
            }
            tempText = myText
        }
    }
    
    init(wrappedValue: String, count:Int) {
        self.wrappedValue = wrappedValue
        self.count = count
    }
}

class Display {
    
    @CharacterLimit(wrappedValue: "", count: 10) var name
    @CharacterLimit(count: 12) var password:String = ""

}
