import UIKit

//
//func showString(completion:()->Void) -> Void {
//    completion()
//}
//
//showString {
//    print("클로저")
//}

var myClosureList = [()->Void]()
var myClosureList2: [()->Void] = []


// 해당 되는 클로저가 함수 안에서만 쓰이지 않는다? @escaping
// 클로저가 언제 실행될지 모르는 때에
// 함수가 메모리에서 내려가도 클로저는 살아있어야 할 때
func showString2(completion: @escaping ()->Void) -> Void {
    myClosureList.append(completion)
}

showString2 {
    print(Int.random(in: 1...100))
}
showString2 {
    print(Int.random(in: 1...100))
}
showString2 {
    print(Int.random(in: 1...100))
}

myClosureList.forEach { completion in
    completion()
}
