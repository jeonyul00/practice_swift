import UIKit

/*
    문법 공부는 정기적으로 복습을 할 필요가 있다.
 */

// array , tuple, dictionary, set

var arr = [1,2,3]
let arr2: [Int] = [1,2,3]
let arr3: Array<Int> = [1,2,3]
let arr4: Array<Int> = [Int](1...10)
let arr5: [Int] = Array<Int>(1...10)
let arr6 = Array(repeating:10, count: 10)
let arr7:[String] = []
var arr8 = [Int]()
var arr9: [String] = Array()
var arr10: [Any] = [0,"string", true, 0.1]

arr.append(10)
arr.insert(20, at: 0)
arr.insert(20, at: arr.count)
arr.append(contentsOf: [7,8,9])
arr.append(contentsOf:arr2)

let removeElement = arr.remove(at: 0) // return element
let removeElement2 = arr.removeLast() // return element
let removeElement3 = arr.removeFirst() // return element
arr.removeFirst(2) // not return elemet
arr[2] = 30
arr[4]
arr[arr.count - 1]
arr.last

var set1:Set<Int> = [1,2,3,4]
var set2 = Set<Int>()
var set3: Set<Int> = []

set1.insert(5)
set1.insert(6).inserted // true
set1.insert(6).inserted // false
set1.update(with:6) // 6 -> 기존의 값 반환, 기존의 값을 덮어씌움
set1.update(with:7) // nil -> 기존의 값 반환 == nil이라는 것은 기존에는 값이 없었다.
set1.remove(6)
set1.remove(100)
set1.remove(at:set1.firstIndex(of: 7)!) // set에 인덱스가 없는데...? => 컴퓨터 내부적으로는 순서가 있음 => 다만 사용자가 못 볼 뿐
set1.firstIndex(of: 5)

set2.insert(10)
set2.insert(20)
set2.insert(30)
set2.insert(4)
set2.insert(5)
print(set1)
let union = set2.union(set1) // 합집합
print(union)
let intersection = set1.intersection(set2) // 교집합
print(intersection)
let symmetricDifference = set1.symmetricDifference(set2) // 대칭 차집합
print(symmetricDifference)
let subtracting = set1.subtracting(set2) // 여집합
print(subtracting)

union.isSuperset(of: set2) // true
union.isSubset(of: set2) // false
set2.isEmpty // false
set2.isDisjoint(with:set3) // 중복된 값이 하나도 없냐?

var dic: [String:String] = [:]
var dic2 = Dictionary<String,String>()
var dic3 = [String:String]()
var dic4 = ["king":"yunG", "jeon": "st"]
dic.isEmpty
dic.count
dic["jeon"] = "yul"
dic["jeon"]
dic[""] = ""
dic[""]
dic[" "] = " "
dic[" "]
dic.count
dic.updateValue("value", forKey:"key")
let newDic = dic.merging(dic4) { current, new in return new }
print(newDic)
dic4.removeValue(forKey: "jeon")
print(dic4)
dic4["king"] = nil
print(dic4)
dic.removeAll()
dic.updateValue("newValue", forKey: "newKey")
print(dic)
dic.updateValue("newValueeeeeee", forKey: "newKey")
print(dic)

var tuple = ( jeon:"yul", code: 200, showTrue: true, showFalse: false )
var tuple2:(Int,Int,String) = (1,2,"3")
tuple.jeon

let (one, two, three) = tuple2
one


