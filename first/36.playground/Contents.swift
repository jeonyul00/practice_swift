import UIKit

// property wrappers : 프로퍼티에 기능을 넣어서 사용, 그래서 감싼다를 넣은건가

// 글자 입력 제한 기능
struct CharacterLimit {
    var tempText = ""
    var inputText:String {
        get{
            return tempText
        }
        set{
            var myText = newValue
            while myText.count > 10 {
                myText.removeLast()
            }
            return tempText = myText
        }
    }
    
     // 다른 변수에 또 하고 싶으면? : 복붙해? 그러면 중복이잖아 => @propertyWrpper 어노테이션 붙인다 밑에 다시 만들어보겠다. (컴포넌트화 하는 느낌이네)
}


var limit = CharacterLimit()
limit.inputText = "12345678910"
limit.inputText


// ---- 반드시 리턴하는 값을 반드시 wrappedValue라는 이름으로 써야함
@propertyWrapper
struct CharacterLimit2 {
    
    var limitCount = 0
    var tempText = ""
    var wrappedValue:String {
        get{
            return tempText
        }
        set{
            var myText = newValue
            while myText.count > limitCount {
                myText.removeLast()
            }
            return tempText = myText
        }
    }
    
    init(wrappedValue:String,limitCount:Int){
        self.wrappedValue = wrappedValue
        self.limitCount = limitCount
    }
}

// 사용 시
class Display {
    @CharacterLimit2(limitCount: 10)
    var name:String = "" // 초기값을 ""으로 했기 때문에 위의 프로퍼티래퍼에서 init이 필요
    
    @CharacterLimit2(wrappedValue: "", limitCount: 15)
    var pwd:String
}

var display  = Display()
display.name = "12345678910"
display.pwd = "1122334455666778899"
display.name
display.pwd

