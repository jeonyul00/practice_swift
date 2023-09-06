import UIKit

// subscripts : 컬렉션, 리스트, 시퀀스 등 집합 내 속한 요소에 쉽게 접근할 수 있게 해주는 문법
var names = ["lee", "kim"]
names[0]
names[1]

var colorValue = ["red": "100", "blue" : "001"]
colorValue["red"]
colorValue["red"] = "010"
colorValue

struct Member {
    var name:String
    var age:Int
}

let member1 = Member(name: "kim", age: 20)
let member2 = Member(name: "lee", age: 30)
let member3 = Member(name: "jeon", age: 40)
let member4 = Member(name: "park", age: 50)

let members = [member1, member2,member3, member4]
members // [{name "kim", age 20}, {name "lee", age 30}, {name "jeon", age 40}, {name "park", age 50}]


class Group {
    var memebers = [Member]()
    
    // 직접 접근해서 데이터를 가져온다
    // subscript 키워드로 인해 []로 접근 가능
    subscript(index:Int) -> Member {
        get {
            return members[index]
        }
        set {
            memebers[index] = newValue
        }
        
    }
}

let group = Group()
group.memebers = [member1, member2,member3, member4]
group[0]

// 나이대 선택
class Group2 {
    var memebers = [Member]()
    
    enum AgeType {
        case _20s
        case _30s
        case _40s
        case _50s
    }
    
    // ~= : 앞의 값에 포함되냐
    subscript(ageGroup:AgeType) -> [Member] {
        get {
           var outputMemebers = [Member]()
            for member in members {
                if ageGroup == ._20s && 20..<30 ~= member.age {
                    outputMemebers.append(member)
                }
                if ageGroup == ._30s && 30..<40 ~= member.age {
                    outputMemebers.append(member)
                }
                if ageGroup == ._40s && 40..<50 ~= member.age {
                    outputMemebers.append(member)
                }
                if ageGroup == ._50s && 50..<56 ~= member.age {
                    outputMemebers.append(member)
                }
            }
            return outputMemebers
        }
    }
}

let group2 = Group2()
group2.memebers = [member1, member2,member3, member4]
group2[._20s]
