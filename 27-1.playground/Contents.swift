import UIKit

/*
 Closure 파트 중 Capturing Values (값을 잡아둔다) : 클로저는 상수나 변수를 캡쳐할 수 있습니다.
 메모리 해제에 관련하여 다시 한 번 알아보자.
 알다시피 데이터는 참조 타입과 원시 타입이 있지
 참조타입의 경우 변수에 할당되는 값은 메모리의 주소이지 값이 아니지
 swift의 경우에 참조타입은 function, class, closure 등이 있다.
 여기서 문제는 자바나 코틀린의 경우에는 GC(가비지컬렉터)가 있어서 더 이상 쓰지않는 참조 타입 데이터는 메모리에서 자동으로 해제가 되지
 근데 swift는 수동으로 해제해줘야해
 주의점은 참조 타입 데이터를 참조하는 데이터가 하나도 없어야만 해제가 가능해
 이걸 하지 않으면 메모리 오버 어쩌구 이슈가 나는거지 자 다시 한 번 뜯어보자
*/

// reference type : class, function, closure : 데이터 메모리 주소가 할당 됨
// value type : Int, String, Array, Dictionary, struct : 데이터 값이 직접 할당됨

class SomeClass{
    var b = 10
    func someFunc(){
        print("some Func : ",b.description)
        self.b.description
    }
    
    /*
     이 부분이 굉장히 어렵다
     클로저의 내용을 myClosure 변수가 가지고 있다.
    */
    lazy var myClosure: (()->Void)? = {
        // x : myClosure가 생성 될 때 동시에 b도 생성된다 => b가 아직 생성 완료되지 않았기 때문에 b에 접근할 수 없다. => lazy 키워드를 넣는다 : 언제 만들어지냐? 나중에 접근할때(호출할 때) 만들어진다.
        // print("myClosure : ",b.description) : b는 class안의 변수이다
        // 클로저는 명시적으로 self라는 키워드를 써야한다. => self 하면 캡쳐된다(또한 참조된다.)
        
        // 근데 왜 someFunc는 self를 안 써도 오류가 안나는가?
        // ㄴ 클로저 안에서 클로저 바깥에 있는 값을 쓸 때는 참조 타입으로 쓰게된다. => someFunc()의 경우에는 어디에 참조되어있지 않기 때문에 호출 후 바로 메모리에서 바로 끝나게 됨, 그러나 클로저의 경우 myClosure 변수가 참조하고 있기 때문에 메모리에서 제거되지 않음
        // ㄴ 이러면 문제가 무어냐? : 메모리에서 제거 할 때 얘도 참조를 끊어야함
        // self : SomeClass() 값을 캡쳐한다 (참조한다)
        print("myClosure : ",self.b.description)
        // myClosure가 SomeClass()를 참조하고 있지 그러므로 myClosure도 없애야 메모리에서 내릴 수 있다.
    }
    
    // 메모리 해제하는 또 하나의 방법 : 값을 복제
    // [] : 값을 value type으로서 캡쳐한다. <- 아... 이게 뭐야...
    lazy var myClosure2 = { [b] in
        print("myClosure : ",b.description)
    }
    
    // weak : 약하게 참조하겠다.
    lazy var myClosure3 = { [weak self] in
        print("myClosure : ", self?.b.description ?? 0)
    }
    
    deinit {
        print("deinit : 메모리가 해제될 때 호출되는 부분 : 직 전인가 직 후인가는 알아 보고 옆에 써둘것")
    }
}

// 인스턴스화 : 메모리에 올리는거지 : 힙메모리
var myClass:SomeClass? = SomeClass()
var myClass2 = myClass
var myClass3 = myClass2
var myClass4 = myClass3

// 위의 코드는 결국 하나의 주소를 참조하고 있지 : myClass
myClass?.b = 20
myClass2?.b // 20
myClass3?.b // 20
myClass4?.b // 20

// 이때!!! SomeClass()를 메모리에서 해제하고 싶을 때 이를 참조하는 모든 것들이 참조가 끊어져야한다!
// 이게 무슨 말이냐? : SomeClass() <- (인스턴스화) 이게 메모리에 올리는거지 -> 이걸 이제 메모리에서 제거하고 싶다!
// 이 때 myClass, myClass2, myClass3, myClass4 모두 참조를 끊어야 SomeClass()를 메모리에서 제거할 수 있다!!
myClass?.myClosure = nil // 클로저도 해제해야함
myClass = nil
myClass2 = nil
myClass3 = nil
myClass4 = nil

// 위처럼 모든 참조를 제거해야 메모리 해제가 된다!
// 또 하나의 참조 제거 방법 : capture list : 값을 참조하는 것이 아닌 복제한다 (깊은 복사인가? 알아볼 것) => myClosure2로 구현해보겠다
myClass?.myClosure2 // 해제 안해도됨 : 값이 복사해서 사용했기 때문에 : 주의 값을 복사한게 원시 타입이 아닌 데이터일 경우에는 weak 키워드를 넣어야한다.
// weak : 약하게 참조하겠다! 라는 뜻이라네요. 시발 진짜


