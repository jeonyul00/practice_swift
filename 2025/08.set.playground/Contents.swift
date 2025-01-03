import UIKit

// set -> 순서 없음, 중복 안됨
var numbers:Set<Int> = [1,2,3,4,5]
var numbers2 = Set([4,5,6,7,8])
var numbers3: Set<Int> = []
var numbers4 = Set<Int>()

numbers.insert(6).inserted // true
numbers // [1,2,3,4,5,6] 순서는 랜덤
numbers.insert(6).inserted // false -> 중복 허용x
numbers // [1,2,3,4,5,6] 순서는 랜덤

numbers.update(with: 7) // 무조건 넣음 -> 중복 시 덮어쓰기 // nil 반환 이유 -> 기존의 값 반환 -> 기존에 값이 없었으니 nil
numbers.update(with: 7) // 7

numbers.remove(7) // index 아니고 값을 입력 -> 순서가 랜덤이기 떄문에 // 지운 값 반환, 지울 값이 없으면 nil
// set도 index가 있기는함, 다만 순서를 보장하지 않을 뿐 -> 이렇게도 할 수 있는거지
let setIndex = numbers.firstIndex(of: 6)
if let setIndex {
    numbers.remove(at: setIndex)
}

numbers.union(numbers2) // 합집합
numbers.intersection(numbers2)// 교집합
numbers.symmetricDifference(numbers2)// 대칭 차집합 (합집합 - 교집합)
numbers.subtracting(numbers2)// 여집합 1,2,3 a-b

// A가 B에 모두 포함되어 있는가?
numbers.isSubset(of: numbers2) // false
// B가 A에 모두 포함되어 있는가?
numbers2.isSuperset(of: numbers) // false

// 불포함 여부
numbers.isDisjoint(with: numbers2)
