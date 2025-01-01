import UIKit

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
//    return (min:currentMin, max:currentMax)
    return (currentMin, currentMax)
}

let value = minMax(array: [1,2,3])
print(value)

// 암시적 반환: 함수의 전체 본문이 한줄로 표현이 된다면 함수는 맹목적으로 표현식을 반환합니다. 예를 들어 아래의 두 함수는 모두 같은 동작을 합니다:
func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))

// 파라미터 기본값
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) { }
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)

// inout 파라미터
// 함수 파라미터는 기본적으로 상수입니다. 해당 함수의 본문 내에서 함수 파라미터 값을 변경하려고 하면 컴파일 타입 에러가 발생합니다. 이것은 실수로 파라미터의 값을 변경할 수 없다는 것을 의미합니다. 함수의 파라미터 값을 변경하고 함수 호출이 종료된 후에도 이러한 변경된 값을 유지하고 싶다면 in-out 파라미터 (in-out parameter) 로 대신 정의하십시오.
// 함수에 수정가능함을 알리기 위해 in-out 파라미터에 인수로 전달할 때 변수의 이름 앞에 앰퍼샌드 (&)를 붙여줍니다.
func swapTwoInts(a: inout Int, b: inout Int) -> (b:Int,a:Int){
    let temporaryA = a
    a = b
    b = temporaryA
    return (b,a)
}
var someInt = 3
var anotherInt = 107

swapTwoInts(a: &someInt, b: &anotherInt)

// 파라미터 타입으로 함수 타입 (Function Types as Parameter Types)
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"

