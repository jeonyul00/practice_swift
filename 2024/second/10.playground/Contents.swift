import UIKit

/*
    set
*/

let numbers:Set<Int> = [1,2,3,4,5]
let numbers2:Set<Int> = [4,5,6,7,8]

// 합집합
numbers.union(numbers2)

// 교집합
numbers.intersection(numbers2)

// 대칭차집합 (합집합 - 교집합)
numbers.symmetricDifference(numbers2)

// 여집합
numbers.subtracting(numbers2)
numbers2.subtracting(numbers)

// 한 쪽에 모두 포함 여부
let numbers3:Set<Int> = [1,2,3,4,5]
let numbers4:Set<Int> = [1,5]

numbers3.isSubset(of: numbers4) // 3이 4에 다 포함되어 있는가?
numbers4.isSubset(of: numbers3) // 4이 3에 다 포함되어 있는가?
numbers3.isSuperset(of: numbers4) // 3이 4의 수퍼셋이냐?
numbers4.isSuperset(of: numbers3) // 4이 3의 수퍼셋이냐?

// 한 쪽에 모두 불포함 여부
let numbers5:Set<Int> = [1,2,3,4,5]
let numbers6:Set<Int> = [6,7]

numbers5.isDisjoint(with: numbers6)
