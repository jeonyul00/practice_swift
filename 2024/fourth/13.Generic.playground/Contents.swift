import UIKit

// generic: 로직은 같은데 그 안의 타입만 다를때에 -> 타입을 나중에 지정하는거지
// func plus<T: Numeric>(a:T , b: T) -> T {
func plus<T>(a:T , b: T) -> T where T:Numeric, T:Comparable {
    if a > b {
        print(a)
    }
    return a + b
}

plus(a: 1, b: 1)
plus(a: 1.0, b: 1.0)

// --
class Stack<T> {
    var items = [T]()
    
    func push(item:T){
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
    
}

var stack = Stack<String>()
stack.push(item: "one")
stack.push(item: "two")
stack.push(item: "three")
stack.pop()

var stack2 = Stack<any Numeric>()

stack2.push(item: 1)
stack2.push(item: 1.2)
stack2.push(item: 0)
stack2.pop()

// -- Stack + Generic + Protocol
protocol StackProtocol {
    // associatedtype : 프로토콜안에서 제네릭하게 쓰겠다.
    associatedtype T
    func push(item:T)
    func pop() -> T
}

class Stack2<T>:StackProtocol {
    
    // 여기서 타입 지정하거나, 사용할 때 지정하거나
    // typealias T = String
    
    var items = [T]()
    
    func push(item:T){
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
}

var stack3 = Stack2<String>()
stack3.push(item: "wow")
