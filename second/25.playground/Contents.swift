import UIKit

// closure
// 익명함수 쯤 된다
// 아니 자료형이 없네 => {  } 이걸로 감싼다

// func
func plus(a:Int,b:Int)->Int{
    return a + b
}

// 변수나 상수에 closure 대입
var myClosure = { (a:Int, b:Int) -> Int in return a + b }

// props 명을 안쓰는구나
plus(a: 10, b: 20)
myClosure(10, 20)


// func의 파라미터에 closure를 넣어서 사용하는 방식
//  func f1() {
//      print("작업중")
//      print("작업중")
//      f2()
//  }
//
//  func f2() {
//      print("작업 완료")
//  }
//
//  f1()

func f10(closure: () -> Void ) {
    print("작업중")
    closure()
}

// 이제부터 클로저를 생략 문법으로 여러가지 써보겠다
f10(closure: { ()-> Void in print("작업 완료") } )
f10(closure: { print("작업 완료") } )
f10 { print("작업 완료") }


