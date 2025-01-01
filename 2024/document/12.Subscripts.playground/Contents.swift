import UIKit

// Subscripts: class, struct, collection, list의 요소에 접근 할 수 있다.
var names = ["lee","kim","jeon"]
names[1]
var colorValue = ["red" : "100", "blue":"001"]
colorValue["red"]
colorValue["red"] = "빨강"
colorValue["red"]

struct Member {
    var name:String
    var age:Int
}

let member1 = Member(name: "kim", age: 1)
let member2 = Member(name: "lee", age: 2)
let member3 = Member(name: "choi", age: 3)
let member4 = Member(name: "park", age: 4)
let members = [member1,member2,member3,member4]

class Group {
    var members = [Member]()
    
    subscript(index:Int) -> Member {
        get{
            return members[index]
        }
        set {
            members[index] = newValue
        }
        
    }
}

let group1 = Group()
group1.members = [member1,member2,member3,member4]
group1[1].name

class Group2 {
    enum AgeType {
        case _20s
        case _30s
        case _40s
    }
    
    var members = [Member]()
    subscript(ageGroup:AgeType) -> [Member] {
        get {
            var outputMembers = [Member]()
            for member in members {
                if ageGroup == ._20s && 20..<30 ~= member.age {
                    outputMembers.append(member)
                }
                if ageGroup == ._30s && 30..<40 ~= member.age {
                    outputMembers.append(member)
                }
                if ageGroup == ._40s && 40..<40 ~= member.age {
                    outputMembers.append(member)
                }
                
            }
            return outputMembers
        }
                
    }
}

let group2 = Group2()
group2.members = [member1,member2,member3,member4]
group2[._20s]


