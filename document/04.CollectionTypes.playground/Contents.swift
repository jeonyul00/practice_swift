import UIKit

/*
    콜렉션 타입
    array, set, dictionary
 */
// 배열 (array) 은 순서대로 같은 타입의 값을 저장합니다. 같은 값은 배열에 다른 순서로 존재할 수 있습니다.
var arr:Array<String> = ["so","what", "?"]

arr += ["!"]
arr.append("@@")
// print(arr)
arr[arr.count - 1] = "!?"
// print(arr)
arr[2...3] = ["merged"]
// print(arr)
arr.insert("add Value", at: 2)
//print(arr)
for (idx, value) in arr.enumerated() {
    idx
}

// 집합 (set) 은 콜렉션에 순서와 상관없이 같은 타입의 다른 값을 저장합니다. 아이템의 순서가 중요하지 않거나 아이템이 반복되면 안될 때 배열 대신에 집합을 사용할 수 있습니다.
var set = Set<Character>()
set.insert("a")
set.insert("b")
print(set)
set = []
print(set)
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var favoriteGenres2: Set = ["Rock", "Classical", "Hip hop"]

// intersection(_:) 메서드를 사용하면 두 집합의 공통 값을 가지는 새로운 집합을 생성합니다.
// symmetricDifference(_:) 메서드를 사용하면 두 집합의 공통 값을 제외한 새로운 집합을 생성합니다.
// union(_:) 메서드를 사용하면 두 집합의 모든 값으로 새로운 집합을 생성합니다.
// subtracting(_:) 메서드를 사용하면 특정 집합의 공통 값을 제외한 새로운 집합을 생성합니다.
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
oddDigits.isSubset(of: singleDigitPrimeNumbers)
oddDigits.isDisjoint(with: evenDigits)
oddDigits.isSuperset(of: singleDigitPrimeNumbers)

// 딕셔너리 (dictionary) 는 순서와 상관없이 콜렉션에 같은 타입의 키 (key)와 같은 타입의 값 (value)를 저장합니다. 각 값은 딕셔너리 내부에서 값에 대한 식별자로 동작하는 유니크한 키 와 조합됩니다
var namesOfIntegers = [Int: String]()
