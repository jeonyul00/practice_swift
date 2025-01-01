import UIKit

// func
func plus(a: Int, b: Int ) -> Int {
    return a + b
}

// closure: {}
// { (a:Int, b:Int) -> Int in return a + b }
var myClosure = { (a:Int, b:Int) -> Int in return a + b }

myClosure // type: (Int,Int) -> Int
plus // type: (Int,Int) -> Int

plus(a:1, b:1)
myClosure(1,1) // 파라미터 명x: 클로저 내부에서만 파라미터 네임 씀

// ---
// 함수의 파라미터에 클로저를 넣어서 사용하는 방식
func f1(completion:()->Void){
    print("--- 작업 시작 ---")
    print("--- 작업중 ---")
    completion()
}

// 쓰는 방식: 생략 문법이 많다.
f1(completion: { () -> Void in print("--- 작업완료1 ---") })
f1(completion: { print("--- 작업 완료2 ---") })
f1 { print("--- 작업완료3 ---") }
