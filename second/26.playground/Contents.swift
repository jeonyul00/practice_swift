import UIKit

// closure2

// func + closure
func myFunc(closure: () -> Void ) {
    print("func logic")
    closure()
}

myFunc { print("closure logic") }

// func + closure 2개
func myFunc2(closure1: () -> Void, closure2: () -> Void ) {
    print("func logic")
    closure1()
    closure2()
}

// 클로저가 2개 이상이면 두번째 부터는 파라미터 네임 생략 불가, 첫번째 파라미터 네임은 생략
myFunc2 {
    print("closure1 logic")
} closure2: {
    print("closure2 logic")
}

func myFunc4(a:Int, closure:()->Void){
    print(a)
    closure()
}

// 클로저가 1개면 파라미터네임 생략가능, 일반 매개변수랑 다르게 생각할 것
myFunc4(a: 4) {
    print("클로저")
}

// closure + parameter
func myFunc5(completion:(Int)->Void) {
    print("func logic")
    completion(1)
}

// 클로저 안에 프롭스가 있기 때문에 in
myFunc5 { num in
    print(num)
}

func showScore(a:Int){
    print("func logic ::: ", a.description)
}

// !!! 이 개념 좀 헷갈리네 => 클로저의 프롭스에 함수 이름을 넣었지(실행x), 함수 자체를 받는거지 =>
myFunc5(completion: showScore)

// closure + return
func myFunc6(compeltion:()->Int){
    print("my func 6")
    let a = compeltion()
    print(a)
}

myFunc6 {
    return 18
}
