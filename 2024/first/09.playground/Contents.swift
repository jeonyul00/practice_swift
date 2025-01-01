import UIKit

// Set Type : 중복 x, 순서 x
var numbers:Set<Int> = [1,1,2,2,3,4,4,5]
var numbers2:Set = [1,1,2,2,3,4,4,5]
var numbers3 = Set<Int>([1,1,2,2,3,4,4,5])

numbers
numbers2
numbers3

// empty Set
let numbers4 = Set<Int>()
var numbers5:Set<Int> = []
// x : Cannot use mutating member on immutable value: 'numbers4' is a 'let' constant : 아니 이거 원시타입인가? js랑 달라서 헷갈리는군
//numbers4.insert(1)
numbers4

// add
// inserted : 성공 여부
numbers.insert(1) // (inserted false, memberAfterInsert 1)
numbers.insert(10) // (inserted true, memberAfterInsert 10)
numbers.insert(10) // (inserted false, memberAfterInsert 10)
numbers.insert(10).inserted
numbers.insert(10).inserted == true
numbers.insert(10).inserted == false

numbers.update(with: 100) // 덮어쓰기 개념 : 기존 값을 반환 없으면 nil
numbers.update(with: 100) // 덮어쓰기 개념 : 기존 값을 반환

// remove
numbers.remove(100) // 지우는 요소 반환, 해 당 요소가 없으면 nil
numbers.remove(100) // 지우는 요소 반환, 해 당 요소가 없으면 nil
numbers

// index를 이용한 제거
let index = numbers.firstIndex(of: 10) // 내부의 인덱스(array의 index랑 다름)
numbers.remove(at: index!)
numbers

numbers.removeAll()
numbers


