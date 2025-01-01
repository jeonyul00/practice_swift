import UIKit

/*
 제너릭 코드 (Generic code) 는 정의한 요구사항에 따라 모든 타입에서 동작할 수 있는 유연하고 재사용 가능한 함수와 타입을 작성할 수 있습니다. 중복을 피하고 명확하고 추상적인 방식으로 의도를 표현하는 코드를 작성할 수 있습니다.
 */

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
someInt // 107

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func plus<T>(a:T, b:T) -> T where T: Numeric, T: Comparable {
    if a > b {
        
    }
    return a + b
}

plus(a: 1, b: 2)


protocol StackProtocol {
    associatedtype T
    func push(elements: T)
    func pop() -> T
}

class Stack<T>: StackProtocol {
    var items = [T]()
    
    func push(elements: T) {
        items.append(elements)
    }
    
    func pop() -> T {
        items.removeLast()
    }
}

var stringStack = Stack<String>()
var intStack = Stack<Int>()

