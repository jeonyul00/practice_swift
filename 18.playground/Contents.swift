import UIKit

// Operators

// Comparison : 비교
// ==, ===
var a = 10
var b = 20
a == b

var c = 10
a == c

var arr = [1,2]
var arr2 = [1,2]
arr == arr2

var testSet:Set<Int> = [1,2,3,3]
var testSet2:Set<Int> = [1,2,3,3,3]
testSet == testSet2 // true

if testSet == testSet2 {
    print("true")
}

if testSet.count >= testSet2.count {
    print("true")
}

// 3항 연산자
testSet.count > testSet2.count ? print("true") : print("false")

// Range Operator
// 0...5
// for in loop
// 0...5 : 0에서부터 5까지
for index in 0...5 {
    print(index)
}

// 0부터 4까지
for index in 0..<5 {
    print(index)
}


let names:Array<String> = ["kim", "jeon", "choi", "lee", "park", "seo"]

for idx in 0 ..< names.count {
    print(names[idx])
}

for name in names {
    print(name)
}


for name in names[0...1] {
    print(name)
}

for name in names[0...] {
    print(name)
}

for name in names[...3] {
    print(name)
}

// Logical Operator
let isGreen = true
let isRed = true

if isGreen && isRed {
    print("&&")
}

if isGreen || isRed {
    print("||")
}

if !isRed {
    print("is not Red")
}
