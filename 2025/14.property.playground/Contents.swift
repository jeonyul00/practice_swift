import UIKit

// 저장된 프로퍼티: stored property
class MyClass {
    var name: String = "" // 프로퍼티
}

struct MyStruct {
    var name: String = "" // 프로퍼티
}

let myClass = MyClass() // 참조
let myStruct = MyStruct() // 값 자체를 복사
myClass.name = "test" // 이건 let이어도 됨 왜? -> 원본을 건드니까
// myStruct.name = "test" x 이건 안됨 -> 인스턴스도 var로 바꾸면 됨
// 상수와 변수 값 타입 참조 타입 이해할 것

// 지연된 프로퍼티: lazy property
class MyClass2 {
    lazy var name: String = "" // 호출 시 메모리에 올라감
    var age: Int = 20
    lazy var isAdult = age > 19 ? true : false
}

// 계산된 프로퍼티: computed property
class MyClass3 {
    var age: Int = 20
    
    // 읽기 전용
    var isAdult: Bool {
        age > 19 ? true : false
    }
    
    var isAdult2: Bool {
        get {
            !temp
        }
        set {
            temp = newValue
        }
    }
    
    var temp = false
}

// -- 프로퍼티 옵저버
class StepCount {
    var steps = 0 {
        willSet {
            print(newValue)
        }
        didSet {
            print(oldValue)
        }
    }
}

let stepCount = StepCount()
stepCount.steps = 1

// property Wrappers: custom
// 내보낼 이름은 반드시 wrappedValue로 해야함
@propertyWrapper
class StrLimit {
    var wrappedValue:String {
        get {
            return temp
        }
        set {
            var txt = newValue
            if txt.count > count {
                txt.removeLast()
            }
            temp = newValue
        }
    }
    var temp = ""
    var count = 0
    
    init(wrappedValue: String,count:Int) {
        self.wrappedValue = wrappedValue
        self.count = count
    }
}

// 불러오기
class Display {
    @StrLimit(wrappedValue: "", count: 5) var name: String
    @StrLimit(wrappedValue: "", count: 10) var pwd: String
    
    
}

