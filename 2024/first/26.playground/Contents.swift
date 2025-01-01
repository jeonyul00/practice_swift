import UIKit

// Closure2

// func + closure
func myFunc(closure: () -> Void) {
    
}

// func + closure 2개
func myFunc2(closure1: () -> Void, closure2: () -> Void) {
    print("function")
    closure1()
    closure2()
}

myFunc2 {
    // 처음 나오는 클로저는 파라미터 네임이 생략 : 처음만.
    print("클로저 1이 실행됨")
} closure2: {
    print("클로저 2가 실행됨")
}

// func + closure 3개
func myFunc3(closure1: () -> Void, closure2: () -> Void, closure3: () -> Void) {
    print("function")
    closure1()
    closure2()
    closure3()
}


myFunc3 {
    print("클로저 1이 실행됨")
} closure2: {
    print("클로저 2이 실행됨")
} closure3: {
    print("클로저 3이 실행됨")
}

func myFunc4 (a:Int, closure : () -> Void ){
    print(a)
    closure()
}

myFunc4(a: 10) {
    // 네임 생략 && 클로저가 괄호 안에 포함 안되어있네 아 문법이 뭐 이래
    print("클로저 내용")
}

//
func myFunc5(completion:(Int)->Void){
    print("function")
    let total = 100
    completion(total)
}

myFunc5 { num in
    print(num.description + "점")
}


func showScore(_ a:Int) -> Void{
    print(a.description + "점")
    
}

myFunc5(completion: showScore)

// 클로저에 리턴 : 아... 아니... 뭐... 알겠는데... 왜 굳이 이따위로 만든거지...
func myFunc6(completion:()->Int)->Int{
    print("function6")
    return completion() + 10
}

let a = myFunc6 {
    return 10
}

a
