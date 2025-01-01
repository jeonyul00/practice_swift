import UIKit

struct UnitConversion {
    var oz:Double = 0
    var ml:Double = 0
    
    init(oz: Double) {
        self.oz = oz
        self.ml = oz * 29.5
    }
    
    init(ml:Double) {
        self.oz = ml / 29.5
        self.ml = ml
    }
}


var unitConversion = UnitConversion(ml: 1)
var unitConversion2 = UnitConversion(oz: 1)
unitConversion.ml
unitConversion.oz
unitConversion2.ml
unitConversion2.oz

// 근데 꼭 저렇게 이닛을 여러개 만드는 방법만 있나..? -> ㄴㄴ 다른 방법도 있음

// convenience init: 다른 이닛을 반드시 실행하고 그걸 기반으로 만든다.
class Profile {
    var name: String
    var age: Int
    var isAdult: Bool
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.isAdult = age > 19 ? true : false
    }
    
//    init(age:Int) {
//        self.name = ""
//        self.age = age
//        self.isAdult = age > 19 ? true : false
//    }
    
    // 이걸 쓰려면 반드시 다른 이닛을 써야함
    convenience init(age: Int) {
        self.init(name: "", age: age)
    }
    
    func showName(){
        print(name)
    }
}

// 상속
class Member:Profile {
    
    override init(name: String, age: Int) {
        super.init(name: name+"님", age: age)
    }
    
    override func showName() {
        print(name + " 안녕 ")
    }
}

let profile = Profile(name: "JEONYUL", age: 30)
let memeber = Member(name: "jeonyul", age: 30)
profile.showName()
memeber.showName()


// required init
class BaseView {
    
    // 코드로 ui
    init(frame: CGRect) {
        
    }
    
    // 스토리보드로 ui
    required init(coder:NSCoder) {
        
    }
    
}


class RedView:BaseView {
    
    init() {
        let frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        super.init(frame: frame)
    }
    // 이닛을 하나라도 했으면, required 이닛은 반드시 해야함, 안쓰더라도 => 이닛을 하나도 안했다면 그것은 이미 암묵적으로 모든 이닛을 한 것이다. -> 자바에서 기본 생성자를 안써도 쓴 것처럼
    
    override init(frame: CGRect) {
        let frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("이건 안쓸거지만 반드시 구현해둬야 함")
    }
    
}
