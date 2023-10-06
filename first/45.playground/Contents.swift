import UIKit

// higher order function : 고차함수

// array
let names = ["jeon","kim","lee","park","choi"]

// dictionary
let namesDic = ["jeon":"전","kim":"김","lee":"이","park":"박","choi":"최"]

var newNames = [String]()
names.forEach { element in
    newNames.append(element + "님")
}

newNames

// map
let newNames2 = names.map { element in element + "님" }

newNames2

let newNames3 = names.map { element in element.count }

newNames3

let dicValue = namesDic.map { element in
    element.value
}

dicValue

// filter
var filterArr = names.filter { element in
    if element.count > 3 {
        return true
    }
    return false
}

filterArr

var filterArr2 = names.filter { element in
    element.count > 3
}

filterArr2

var filterArr3 = names.filter { $0.count > 3 }

filterArr3

// map + filter
let mapFilterArr = names.filter { element in
    element.count > 3
}.map { element in
    element.count
}

mapFilterArr

// reduce 이끼이끼
var mergeArr = names.reduce("") { partialResult, element in
    partialResult + element
}

mergeArr

// compactMap : nil제거, optional 벗겨내는 역할
var numbers = [1,2,3,nil,4,5,6,7,nil,8]
var compactArr = numbers.compactMap { element in element }
var compactArr2 = numbers.compactMap { $0 }

compactArr
compactArr2

var stringNumbers = ["1","2",nil,"aa"]
let compactValue = stringNumbers.compactMap(){ Int($0 ?? "") }
compactValue

// flatMap
// 이차원 배열을 일차원배열로 : 한 단계만 푼다. 3차원은 2차원으로
