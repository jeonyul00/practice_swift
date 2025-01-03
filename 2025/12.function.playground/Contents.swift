import UIKit

func presentScore(_ num: Int) -> Int {
    return num
}

// 여러 개 반환 시
func solution() -> (a: Int, b: Int) {
    return (1,2)
}

let test = solution()
test.a
test.b


// inout -> 프롭스는 읽기 전용이잖아. 그거 뿌숨
var num = 100

func solution(num: inout Int) {
    num += 100
}

solution(num: &num)
num

// --- fucntion type
var someString: String = ""

func sayHello() {
    print("hello")
}


var test2: ()->Void
test2 = sayHello
