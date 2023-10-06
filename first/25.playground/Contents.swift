import UIKit

// Closure
// 함수와 개념이 같음

// function
func plus(num:Int,num2:Int)->Int {
    return num+num2
}

// closure : {}로 closure 명시.. 뭐 이딴 문법이 있냐 : 구현부는 in으로 명시 : 약간 js의 익명함수 같네
let myClosure:(Int,Int)->Int = { (num:Int,num2:Int)->Int in return num+num2 }


// function랑 다른점
plus(num: 10, num2: 20)
myClosure(10, 20)

// x : 클로저는 프롭스 명 따위 없다.
// myClosure(num:10,num2:20)

func f1(){
    print("작업중")
    print("작업중")
    f2()
}

func f2(){
    print("작업완료처리")
}

f1()

// function의 parameter에 closure를 넣어서 사용하는 방식
// --- 위의 로직을 클로저로 만들어 보자

func f10(myClosure: ()-> Void ){
    print("작업중")
    print("작업중")
    myClosure()
}

func f20(){
    print("작업완료처리")
}

f10(myClosure: { ()-> Void in f20() })
// 생략 : 타입이 ()-> Void의 경우 생략 가능
f10(myClosure: { f20() })
// 생략 : 클로저 명 생략 가능
f10 {()->Void in f20()}
// 생략 : 지금의 경울 둘 다 생략 가능
f10 { f20() }
