import UIKit

// Array
let numbers:Array<Int> = [1,2,3,4]
numbers

// x : let이라 안된다 : 참조타입 아닌가? 근데 왜...
// Cannot use mutating member on immutable value: 'numbers' is a 'let' constant
// numbers.append(5)

// var numbers2: Int[] = [1,2,3,4]
var numbers2: [Int] = [1,2,3,4]
numbers2
numbers == numbers2 // 이게 왜 true???
numbers2.append(5)
numbers2

// 1 ~ 10
var numbers3 = Array<Int>(1...10)
numbers3
// test
var numbers4 = Array<Int>(0o1...0o10000)
numbers4
var numbers44 = Array<Int>(0x1...0x10000)
numbers44

// 1,1,1,1,1
var number5 = Array(repeating: 1, count: 5)
number5

// x : Empty collection literal requires an explicit type
//var emptyArr = []

var emptyArr:Array<String> = []
var emptyArr2:Array<String> = Array()
var emptyArr3:Array<String> = Array<String>()
var emptyArr4:Array<String> = [String]()

// any array
var arr: [Any] = [0,"1",true]
arr

// add
var numberArr:Array<Int> = [1,2,3,4,5,6,7,8,9]
var numberArr2:Array<Int> = [1,2,3,4,5,6,7,8,9]
numberArr.append(10)
numberArr.insert(0, at: 0) // 해 당 인덱스에 요소 삽입

// arr 추가
numberArr.append(contentsOf: numberArr2)
numberArr
numberArr.insert(contentsOf: numberArr2, at: 0)
numberArr

// remove
numberArr.removeAll()
numberArr2.remove(at: 8) // 해당 인덱스의 요소를 반환하며 제거
// x : error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x18bd55e10).
// numberArr2.remove(at: numberArr2.count) 안되는거 더럽게 많네

numberArr2.removeFirst()
numberArr2.removeLast()
numberArr2
numberArr2.removeFirst(2) // 0번 부터 몇 개의 요소를 지울 것인가
numberArr2.removeLast(2) // 마지막 부터 몇 개의 요소를 지울 것인가

// replace
var arr2 = [10,20,30,40]
arr2[0] = 0
arr2.insert(1, at: 1)
arr2

let length:Int = arr2.count
arr2.last
