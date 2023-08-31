import UIKit

// 클로저에 대해 복습해보자.

// ---
let closure = { print("clouure") }
let closure2:()->Void = { ()->Void in print("clouure") }
let closure3:(String)->Void = { (str:String)->Void in print(str) }
let closure4:(String)->String = { (name: String) -> String in return name }

// ---
func funcTest(closureTest:()->Void) {
    print("func")
    closureTest()
}

funcTest { print("after func") }
funcTest(closureTest: { ()->Void in print("after func")})

// ---
func returnClosure() -> () -> Void {
    return { ()->Void in print("return closure") }
}

/*
 클로저를 변수나 상수에 대입하지 않고 실행시키고 싶다면, (완벽한 일회성)
 클로저를 ( ) 소괄호로 감싸고, 마지막에 호출 구문인 ()를 추가
*/

({()->Void in print("1회성 즉시 실행")})()

// 문법 경량화
// 트레일링 클로저(Trailing Closure)
// 파라미터가 클로저 1개인 함수
func uniqueParam(closure: () -> Void ) -> Void { closure() }

uniqueParam(closure: {()->Void in print("inline closure")}) // 가독성 안좋음, 밑처럼 argumentLabel 생략 가능
uniqueParam(){()->Void in print("argumentLabel 생략")} // 함수 호출부 () 생략가능ㄴ
uniqueParam {()->Void in print("함수 호출부 생략")}

// 파라미터가 2개 이상 함수
func includeParams(success:()->Void, fail:()->Void) -> Void {
    print("includeParams func")
}

includeParams(success: { ()->Void in print("success") }, fail: {()->Void in print("fail")}) // 가독성 안좋음
// 마지막 파라미터의 클로저는 함수 뒤에 붙여 쓸 수 있다.
includeParams(success:  { () -> () in print("Success!") }) { () -> () in print("Fail!") } // 호출부는 생략할 수 없다 : 마지막 파라미터가 아닌 다른 인자를 넣어야하니까

// closure의 프롭스 타입 생략
func doSomething(closure: (Int, Int, Int) -> Int) { closure(1, 2, 3) }
doSomething(closure: { (a: Int, b: Int, c: Int) -> Int in return a + b + c })
doSomething(closure: { (a, b, c) in return a + b + c })
// 여기서 더 줄일 수 있다 : 파라미터 네임대신 Shortand Argument Names를 사용하면 in 키워드 생략가능
doSomething(closure: { return $0 + $1 + $2 }) // 단일 리턴문이면 리턴도 생략가능
doSomething(closure: { $0 + $1 + $2 }) // 클로저가 마지막 파라미터거나, 단 일 파라이터일 경우 : 트레일링 클로저 가능
doSomething { $0 + $1 + $2 }


// --- 여기까지가 복습 ---

// escaping closure : 함수 밖에서 클로저가 실행되도록 한다
// 결국 배열에 클로저 구현부를 넣어두고 배열[i]로 호출해서 쓰는 로직이네
func showString(completion:()->Void){
    completion()
}
showString {
    print("closure")
}
// 현재 클로저는 함수 안에서만 쓸 수 있다. : @escaping를 쓰면 밖에서도 쓸 수 있다
var myClosureList = Array<()->Void>()
myClosureList

// @escaping : 함수 밖에서 클로저를 사용할 때 사용 == 함수가 종료되어도 함수 내의 클로저는 메모리 어딘가에 있도록 하는 것
func showString2(completion: @escaping ()->Void){
    myClosureList.append(completion)
}

showString2 {
    print("append closure escaping")
}

myClosureList[0]()


var names = ["jeon", "kim", "lee","choi" ]
//names.sort { str1, str2 in
//    return str1 > str2
//}
names.sort { $0 < $1 }
names.sort(by: <)

