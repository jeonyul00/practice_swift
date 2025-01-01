import UIKit

// subscripts
var names = ["jeon", "kim"]
names[0]

var colorValue = ["red":"100", "blue":"001"]
colorValue["red"] // "100"
colorValue["red"] = "200"
colorValue["red"] // "200"

struct Member {
    var name:String
    var age:Int
}

let member1 = Member(name: "jeon", age: 30)
let member2 = Member(name: "kim", age: 28)
let member3 = Member(name: "lee", age: 25)

let members = [member1,member2,member3]

class Group {
    var members = [Member]()
    
    // 배열[몇번] <- 이걸 만드는거지
    subscript(index:Int) -> Member {
        return members[index]
    }
}

let group = Group()
group.members = [member1,member2,member3]
group[0].name
