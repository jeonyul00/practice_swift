import UIKit

// Optional3
var myAge1: Optional<Int> = 20
var myAge2: Int? = 20


if myAge1 == nil {
    // nil일 때 로직
}

if myAge1 != nil {
    // nil이 아닐 때 로직
}

// Option binding
// if let(var)
// guard let(var)

var sum = 0
// unwrapping이 가능 할 때 age에 값이 들어감, nil인 경우는 if가 실행이 안됨
if let age = myAge1 {
    sum = age + 1
}
// x : 접근이 안됨
//age

// guard let(var)
guard let age = myAge1 else {
    // 값을 가져오지 못할 때 로직
    fatalError("is nil")
}

age + 1
