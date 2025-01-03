import UIKit

// array, set, dictionary 중 array
var numbers: Array<Int> = []
var numbers2: [Int] = []
var numbers1: [[Int]] = [[],[]]
var tests:[Any] = [1,true, "", 1.1] // 아 이게 되네?
let numbers3:[Int] = Array(1...10) // [1,2,3,4,5,6,7,8,9,10]
let numbers4:[Int] = [Int](1...10)
let numbers5:[Int] = Array(repeating: 1, count: 5) // [1,1,1,1,1]
var emptyArr:[String] = Array()
var emptyArr2:[String] = []
var emptyArr3 = [String]()

numbers.append(2) // 마지막에 추가
numbers.insert(1, at: 0) // 원하는 인덱스에 추가 // [1,2]
numbers.append(contentsOf: [3,4]) // [1,2,3,4]
numbers.remove(at: 0) // 삭제요소 반환 1
numbers // [2,3,4]
numbers.removeFirst() // 2
numbers // [3,4]
numbers.removeAll() // []

numbers.append(1)
numbers.append(2)
numbers.append(3)
numbers.append(4)
numbers[1] = 22
numbers
numbers.first // 1
numbers[0] // 1
numbers.last // 4

