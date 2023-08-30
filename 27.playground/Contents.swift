import UIKit

// Closure3
// capturing value

// reference type : class, function, closure : 참조
// value type : Int, String, Array, Dictionary, struct : 원시
// 아.. js랑 다르네

// 이 페이지는 27-1로 다시 한 번 해보면서 이해하겠다................................................................................................................................................................
/*
    메모리 해제에 관한 내용임 , weak : 깊은 복사? 주소값을 참조하지 않고 값만 복사한다. == 약하게 참조한다?
    아니 capturing 파트에서 뭐...
 */

var a = 1
var b = 1
a == b

func test(){
    print(a)
}

func test2(){
    print(b)
}

// 이게 왜 true냐 시발, 참조타입이라며
test() == test2()


// 메모리 해제도 내가해야 됨? 가비지컬렉터 어디갔어... : 해제하려면 전제 조건으로는 참조(인스턴스)가 아예 없어야함
// 참조한 객체를 nil로 재할당하면 해제됨
class SomeClass {
    var a = 0
    
    func someFunc(){
        print(a)
    }
    
    //  클로저도 메모리에서 해제해야 함
    lazy var myClosure:(() -> Void)? = {
        print(self.a) // 아직 a가 생성이 안되지 : 나중에 만드려면 어쩌지? : lazy 키워드를 붙이면 나중에 접근 할 때 만들어짐
        // self : this 같은 아이구나. : b를 참조함
        // self.a : 얘를 캡쳐 뭐
    }
    
    deinit{
        print("deinit : 메모리 해제 된 후 : 마치 useEffect의 cleanUp 함수 같은 애인가")
    }
}


var testClass:SomeClass? = SomeClass()
var testClass2:SomeClass? = SomeClass()
var testClass3:SomeClass? = testClass2

testClass === testClass2 // false 이게 맞지
testClass2 === testClass3 // true

testClass2?.a = 1
testClass3?.a // 1 : 참조가 같아서

testClass2?.myClosure // 클로저 사용하면 참조를 끊어야 됨
testClass2?.myClosure = nil

// 참조 제거
testClass = nil
testClass3 = nil
testClass2 = nil



