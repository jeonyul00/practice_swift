import UIKit

// func
func plus(num: Int, num2:Int) -> Int {
    return num + num2
}

// closure
let myClosure = { (num: Int, num2:Int) -> Int in
    return num + num2
}

plus(num: 1, num2: 2)
myClosure(1, 2) // 파라미터 레이블 명시 안 함 안됨

// 파라미터에 클로저 넣기
func f10(completion:()->Void) {
    print("작업중1")
    print("작업중2")
    completion()
}

f10 { print("작업 완료") }

// ---

func myFunc(completion:()->Void,completion2:()->Void ){
    completion()
    completion2()
}

// 클로저가 2개 이상이면, 첫 클로저의 파라미터 네임만 생략 가능
myFunc {
    print("closure1")
} completion2: {
    print("closure2")
}

// closure + Int
func myFunc5(completion: (Int)->Void){
    let number = Int.random(in: 1...5)
    completion(number)
}

myFunc5 { num in
    print(num)
}

func showScore(num:Int){
    print(num.description)
}

// ???????? 아 클로저로 함수를 전달한거네
myFunc5(completion: showScore)

func myFunc6(completion:()->Int) -> Void {
    var zero = completion() - 1
    print(zero)
}

myFunc6 { return 1 }
