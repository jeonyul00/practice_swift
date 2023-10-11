import UIKit

/*
    set
    중복x, 순서x
*/

var numbers:Set<Int> = [1,1,2,2,3,3]
var numbers1:Set = [1,2,3,4,1,2,3,4]
var numbers2 = Set([1,2,3,4,1,2,3,4])

// empty Set
var numbers3 = Set<Int>()
var numbers4:Set<Int> = []

// add
numbers.insert(1) // (inserted false, memberAfterInsert 1)
// 들어가면 inserted true 안 들어가면 inserted false
numbers.insert(4) // (inserted true, memberAfterInsert 4)
numbers.update(with: 4) // 덮어쓰기 : 무조건 넣음, 기존에 값이 있으면 기존값 반환, 기존에 없는 값이면 nil(기존에 값이 없는데 없는 값을 반환하니까)반환
numbers.update(with: 18)

// delete
numbers.removeAll()
numbers.insert(1)
numbers.insert(2)
numbers.insert(3)
numbers.insert(4)

numbers.remove(1) // 지워지면 지운 후에 지운값 반환
numbers.remove(100) // nil : 지울 값이 없으니까 nil반환

let setIndex = numbers.firstIndex(of: 2)
numbers.remove(at: setIndex!) // 순서가 없지 않는가? -> 내부적인 index값이 있다. 다만, 우리가 컨트롤 할 수 없을 뿐

