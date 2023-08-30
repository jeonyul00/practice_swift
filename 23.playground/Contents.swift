import UIKit

// function
// 프롭스를 왜 저 따위로 받아...
func testFunc(score:Int) {
    // description : 스트링 타입으로 변환 : 아이폰에서 화면에 나오려면 스트링 타입으로 해야함 : Int 안나옴
    print("score is", score.description)
}

testFunc(score: 100)

func testFunc2(number:Int, number2:Int) -> String {
    print(number.description , number2.description)
    return "test"
}

let a = testFunc2(number: 10, number2: 100)
a


func testFunc3() {
    print("test")
}

// mutiple return
func testFunc4() -> Array<Int> {
    return [1,2,3]
}

let arr = testFunc4()

// mutiple return
func testFunc5() -> (one: Int, two: Int) {
    return (1,200)
}

let (value,statusCode) = testFunc5()
value
statusCode


func underBarProps(_ num:Int, _ num2: Int) -> Int{
    return num + num2
}

let aa = underBarProps(1,2)
aa

// in-out paramters
var myScore = 100
func addFive() {
    myScore += 5
}
addFive()
myScore

/*
 Swift - Inout 파라미터
 Swift의 inout 파라미터에 대해 알아봅시다.

 In-Out ParametersPermalink
 Swift에서 함수의 파라미터는 상수(Constant)이므로 함수 내부에서 파라미터의 값을 변경할 수 없다
*/

// inout : 값을 직접 적용? : 함수에서 파라미터의 값을 변경하고, 변경된 값이 함수 호출이 종료된 후에도 지속되길 원한다면 inout 파라미터를 사용하면 된다.
func addFive2(score: inout Int) {
    score += 5
}

addFive2(score: &myScore)
myScore
