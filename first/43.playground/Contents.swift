import UIKit

// Generic
func plus(a:Int,b:Int)->Int{
    a + b
}

// o
 plus(a: 1, b: 1)
// x : Int 타입이 아니니까
// plus(a: 1.1, b: 1.1)

// ts랑 다르게 T : Numeric, ts였으면 <T extends Number>
func plus<T: Numeric>(a:T,b:T) -> T {
    // if a > b { print("a") }
    return a + b
}

// 조건을 뒤에다 붙이면 조금 더 확장 할 수 있다.
func plus<T>(a:T,b:T) -> T where T: Numeric, T : Comparable {
    if a > b { print("a") }
    return a + b
}

plus(a: 1, b: 1)
plus(a: 1.1, b: 1.1)
plus(a: 1, b: 1.1)
plus(a: 1.1, b: 1)

// ----- ex
class Stack<T> {
    var items = [T]()
    
    func push(_ value:T) -> Void {
        items.append(value)
    }
    
    func pop() -> T {
        items.removeLast()
    }
    
}

var stringStack = Stack<String>()
stringStack.push("only")
stringStack.push("string")
stringStack.items

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.items

// -- 프로토콜화
protocol StackProtocol {
    associatedtype T // 제네릭 설정
    func push(_ value:T)
    func pop() -> T
}

class Stack2<T>:StackProtocol {
    var items = [T]()
    
    func push(_ value:T) -> Void {
        items.append(value)
    }
    
    func pop() -> T {
            return items.removeLast()
    }
}



var string2Stack = Stack2<String>()
string2Stack.items

























