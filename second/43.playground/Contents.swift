import UIKit

// Generic
// 아직 타입을 모를 때

//func plus<T:Numeric>(a:T, b:T) -> T {
//    return a+b
//}

// 확장을 2개 이상해야할 떄
func plus<T>(a:T, b:T) -> T where T:Numeric, T:Comparable {
    return a+b
}

plus(a: 20, b: 30)
plus(a: 20.0, b: 30.0)


// protocol로 정의
protocol StackProtocol {
    associatedtype T // 제네릭을 쓰겠다 선언
    func push(_ str:T)
    func pop() -> T
}

class Stack<T>:StackProtocol {
    var items = [T]()
    func push(_ str: T) {
        items.append(str)
    }
    func pop()->T{
        return items.removeLast()
    }
}

var stack = Stack<String>()
stack.push("a")
stack.push("b")
stack.push("c")
stack.push("d")
stack.push("e")
stack.items

var stack2 = Stack<any Numeric>()
stack2.push(1)
stack2.push(1.2)
stack2.items

