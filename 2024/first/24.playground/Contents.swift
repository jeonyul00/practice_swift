import UIKit

// function type
var someString:String = ""

func sayHello() {
    print("hello")
}


sayHello() // ()->() && ()->void

func plus(a:Int,b:Int) -> Int {
    return a + b
}

func minus(a:Int,b:Int) -> Int {
    return a - b
}

plus(a: 1, b: 2) // (Int,Int) -> Int


// ---
let inputValue = 4
let inputValue2 = 5

// +를 누르면 연산까지 다 됨 -> 버튼을 선택하는 기능만 넣고 싶음
func selectButton1(buttonStyle:String){
    if buttonStyle == "+" {
        plus(a: inputValue, b: inputValue2)
    }
    if buttonStyle == "-" {
        minus(a: inputValue, b: inputValue2)
    }
}

// 타입 지정! : 변수에 타입만 넣어두고 -
var calc: ((Int,Int)->Int)?

func selectButton2(buttonStyle:String) {
    if buttonStyle == "+" {
        calc = plus
    }
    if buttonStyle == "-" {
        calc = minus
    }
}

// 연산
func showResult(){
    calc?(inputValue,inputValue2)
}
