import UIKit

// 레퍼런스 타입: 클로저 클래스 함수
// 값 타입: 나머지

var str = "string"
var str2 = "string"

str == str2

class SomeClass {
    var testNum:Int = 0
    
    func testFunc() {
        // 얘는 뭐 누가 참조하지 않으니까 안끊어도 됨
        print("func ::: ",testNum)
    }
    
    // 캡쳐링: 클로저testClosure가 구현부에서 어떠한 프로퍼티를 쓰려면 값을 캡쳐해야함, 기본적으로 참조형으로 참조함
    lazy var testClosure = {
        // 여기서 testClosure가 testNum값을 참조하니까- 얘도 끊어줘야함 => 어떻게? 클로저는 기본적으로 참조형으로 가져오는데 이걸 값 타입으로 가져오면 되겠다. 아니면 저 변수를 옵셔널로하고 이따가 nil처리 해도 이론적으로는 가능할 듯
        print("closure ::: ",self.testNum)
    }
    
    lazy var testClosure2 = { [weak self] in // 값을 사용할 때 참조형이 아니고 값 형으로 가져온다~ => 가져올 당시의 값을 가져오는 것이기 때문에 어쩌구 => 근데 또 웃긴게 [] 안에 값 형을 넣어야 값형으로 가져옴, 참조형을 넣으면 참조형으로 가져옴 => weak 키워드 명시
        print("closure ::: ", self?.testNum ?? "")
    }
    
    deinit {
        print("메모리 해제")
    }
}

var class1:SomeClass? = SomeClass()
var class2 = class1

class1?.testNum = 1
class2?.testNum
class1?.testClosure2

// SomeClass를 메모리에서 내리려면 이를 참조하는 모든 값을 끊어야한다~
class1 = nil
class2 = nil
class1?.testClosure
