import UIKit

// escaping closure : 함수에서 함수 밖으로 클로저를 실행 시키도록 하는 개념
var myClosureList = [()->Void]()
var myClosureList2:[()->Void] = []

func showString(completion: @escaping ()->Void){
    myClosureList.append(completion) // x : 이러면 클로저가 함수 밖으로 나가는 개념인데 이렇게는 안되지 => 프롭스의 클로저 타입에 @escaping 추가
}

showString {
    print("myClosureList에 이 클로저를 담겠다! ")
}

showString {
    print("이것도 myClosureList에 이 클로저를 담겠다! ")
}

myClosureList.count

// ---

var names = ["jeon", "lee", "kim", "cho"]
// 정렬 축약 : 다 같은 뜻
names.sort(by: {(str1:String, str2:String) -> Bool in return str1 > str2 })
names.sort(by: {(str1, str2) in return str1 > str2 })
names.sort {(str1, str2) in return str1 > str2 }
names.sort { current, new in return current > new }
names.sort { current, new in current > new }
names.sort { $0 > $1 }
names.sort(by: >)
