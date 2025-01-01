import UIKit

// collection : array, set, dictionary

// array
// 순서 보장

// todo: 아니 결국 변수가 메모리 위치 값을 가지고 있는거 아닌가? 그러면 var가 아닌 let을 써도 되지 않나? ->
var numbers = [1,2,3]
var numbers2:[Int] = [1,2,3]
var numbers3:Array<Int> = [1,2,3]

// 1 ~ 10
var numbers4 = Array<Int>(1...10)
var numbers5 = [Int](1...10)

// 1,1,1,1,1,1,1,1,1,1,1
var numbers6 = Array<Int>(repeating: 1, count: 10)
var numbers7 = [Int](repeating: 1, count: 10)

// empty arr
var emptyArr:[String] = Array()
var emptyArr2 = Array<String>()
var emptyArr3:[String] = []
var emptyArr4 = [String]()

// any
var antArr:[Any] = [1, true, ""] // 아 nil은 안되네
