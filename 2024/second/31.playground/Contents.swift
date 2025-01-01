import UIKit

// init

// oz -> ml
// ml -> oz
// 1oz -> 29.5ml
// 1ml -> 0.033oz
struct UnitConversion {
    var oz:Double = 0
    var ml:Double = 0
    
    init(){}
    
    init(oz:Double){
        self.oz = oz
        self.ml = oz * 29.5
    }
    
    init(ml:Double){
        self.ml = ml
        self.oz = ml / 29.5
    }
    
}

var unitConversion = UnitConversion(ml: 1)
unitConversion.oz

var unitConversion2 = UnitConversion(oz: 1)
unitConversion2.ml

var unitConversion3 = UnitConversion()
unitConversion3.oz

// convenience initializer
// 조건 : 다른 init을 반드시 실행

class profile {
    var name:String
    var age:Int
    var isAdult:Bool
    
    // Designated initializers
    init(name:String, age:Int){
        self.name = name
        self.age = age
        self.isAdult = age > 19 ? true : false
    }
    
    //    init(age:Int){
    //        self.name = ""
    //        self.age = age
    //        self.isAdult = age > 19 ? true : false
    //    }
    
    // 얘가 먼저 호출되고 -> self.init(name: "", age: age)가 호출 됨
    // class에서만 가능
    convenience init(age:Int){
        self.init(name: "", age: age)
    }
}


// 상속
class MemeberProflie:profile {
    // 상속 받은 생성자
    override init(name: String, age: Int) {
        let newName = name + "님"
        // 부모 클래스의 생성자
        super.init(name: newName, age: age)
    }
}

let memeberProflie = MemeberProflie(name: "jeonyul", age: 29)
memeberProflie.name

// required init 반드시 구현해야하는 생성자
class BaseView {
    
    init(frame:CGRect) {
                
    }
    
    // 상속받은 클래스가 init을 한다면 이 init은 반드시 구현해야한다
    required init(coder:NSCoder) {
        
    }
}

class RedView:BaseView {
    
    init() {
        let frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        super.init(frame: frame)
    }
    
    override init(frame:CGRect){
        let frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}




