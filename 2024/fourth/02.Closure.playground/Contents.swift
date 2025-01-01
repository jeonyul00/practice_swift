import UIKit

func myFunc1(completion:()->Void) {
    
}

func myFunc2(completion:()->Void,completion2:()->Void) {
    print("함수 내용")
    completion()
    completion2()
}

// 2번째 클로저부터는 파라미터네임 생략x
myFunc2 {
    print("completion1")
} completion2: {
    print("completion2")
}

func myFunc3(a:String, completion: ()->Void) {
    print(a)
    completion()
}

myFunc3(a: "작업중") {
    print("작업완료")
}

func myFunc4(str: String, completion:(String)->Void) {
    completion(str)
}

myFunc4(str: "프롭스로 스트링을 준다") { str in print(str) }

// --- 함수를 클로저에서 호출

func myFunc5(completion:(Int)->Void) {
    print("myFunc5")
    completion(100)
}

func showScore(a:Int){
    print(a.description + "count")
}

// myFunc5 { num in print(num)}
myFunc5(completion: showScore) // showScore가 파라미터를 받음, 호출(실행)을 하는게 아니고 함수 자체를 받아야해서, 이름만 전달한다

// -- 클로저에 리턴
func myFunc6(completion:()->Int) -> Int {
    print("my func 6")
    return completion() + 1
}

myFunc6 { return 10 }
print(myFunc6 { return 10 }) // 11
