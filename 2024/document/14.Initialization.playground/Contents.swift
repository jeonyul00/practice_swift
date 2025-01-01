import UIKit

// 저장된 프로퍼티에 초기값을 설정하고 새로운 인스턴스가 사용할 준비가 되기 전에 다른 설정이나 초기화를 수행하는 것을 포함합니다.
// 클래스와 구조체는 해당 클래스 또는 구조체의 인스턴스가 생성될 때까지 모든 저장된 프로퍼티에 적절한 초기값을 반드시 설정해야 합니다.

struct UnitConversion {
    var oz:Double = 0
    var ml:Double = 0
    
    // default
    init() {
        
    }
    
    // 오버로딩이 그냥 되는구나
    init(oz: Double) {
        self.oz = oz
        self.ml = oz * 29.5
    }
    
    init(ml: Double) {
        self.ml = ml
        self.ml = ml / 29.5
    }
}

var unitConversion = UnitConversion(ml: 2)
unitConversion.oz
var unitConversion2 = UnitConversion(oz: 2)
unitConversion.ml
var unitConversion3 = UnitConversion()


// convenience init
// 꼭 실행되어야 하는 이닛을 기반으로 다른 이닛을 만든다?
class Profile {
    var name:String
    var age:Int
    var isAdult:Bool
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        self.isAdult = age > 1 ? true : false
    }
    
//    init(age:Int){
//        self.name = "unknown"
//        self.age = age
//        self.isAdult = age > 1 ? true : false
//    }
    
    // class만 가능
    convenience init(age:Int) {
        self.init(name: "unknown", age: age)
    }
        
}


// 상속
class MemberProfile:Profile {
    
    override init(name: String, age: Int) {
        super.init(name: name + "님", age: age)
    }
}

// required init: 반드시 구현해야하는 이닛, 상속인 경우 해당
class BaseView {
    
    init(frame: CGRect) {
                    
    }
    
    required init(coder:NSCoder) {
        
    }
    
}


class RedView:BaseView {
    // 하나라도 생성자를 오버라이드한다면, required는 필수로 작성해야함
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
