import UIKit

// escaping closure

var myClosureList = [()->Void]()

// 함수의 생명주기가 끝나도 클로저의 값을 가지고 있으려면 @escaping
func showString(completion: @escaping ()->Void) {
    myClosureList.append(completion)
}

showString { print("aa") }
showString { print("bb") }
showString { print("cc") }

myClosureList.forEach { completion in
    completion()
}
