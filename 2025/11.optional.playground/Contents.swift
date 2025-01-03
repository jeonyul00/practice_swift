import UIKit

// 옵셔널 -> 값이 있을수도 있고 없을수도 있음
var num: Int? = nil
var num2: Int = 0

if let num {
    num2 = num
} else {
    num = 1
}

num2
num2 = num ?? 1
func test(num: Int?){
    guard let num else { return }
}

