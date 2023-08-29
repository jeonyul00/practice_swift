import UIKit

let numbers:Set<Int> = [1,2,3,4,5]
let numbers2:Set<Int> = [3,4,5,6,7]

// 합집합 : 중복 제거
numbers.union(numbers2)

// 교집합
numbers.intersection(numbers2)

// 대칭 차집합 (합집합 - 교집합)
numbers.symmetricDifference(numbers2)

// 여집합
numbers.subtracting(numbers2)
numbers2.subtracting(numbers)
numbers2.subtracting(numbers2).count

// 한 쪽에 모두 포함 여부
let numbers3:Set<Int> = [1,2,3,4,5]
let numbers4:Set<Int> = [1,5]

numbers3.isSubset(of: numbers4) // 앞의 객체가 뒤의 객체의 서브(자식) 셋인가?
numbers3.isSuperset(of: numbers4) // 앞의 객체가 뒤의 객체의 수퍼(부모) 셋인가?

// 한 쪽에 모두 불포함 여부
numbers3.isDisjoint(with: numbers4) // 중복값이 하나도 없는가? => join되어 있는 값이 없는가?
