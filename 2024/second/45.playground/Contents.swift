import UIKit

// 고차함수
let names = ["jeon", "kim", "lee", "cho", "oh"]

var newNames = [String]()

names.forEach { name in
    newNames.append(name + "님")
}

newNames

let newNames2 = names.map { name in
    name + "사마"
}

newNames2

let namesDic = ["jeon":"전", "kim":"김", "lee":"이", "cho":"조", "oh":"오"]
let valueList = namesDic.map { element in
    element.value
}

valueList


// js랑 다르게 가져오는걸 true, 아닌걸 false
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
