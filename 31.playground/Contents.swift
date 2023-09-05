import UIKit

// class와 sturuct의 초기값 설정

// oz -> ml , ml -> oz
// 1oz -> 29.5ml, 1ml -> 0.033oz

struct UnitConversion {
    var oz:Double = 0
    var ml:Double = 0
    
    // 기본 생성자인가
    init(){
        
    }
    
    init(oz:Double) {
        self.oz = oz
        self.ml = oz * 29.5
    }
    
    init(ml:Double) {
        self.oz = ml / 29.5
        self.ml = ml
    }
}

var unitConversion = UnitConversion(ml:1)
unitConversion.ml
unitConversion.oz


var unitConversion2 = UnitConversion(oz: 1)
unitConversion2.ml
unitConversion2.oz

var unitConversion3 = UnitConversion()
unitConversion3.ml
unitConversion3.oz

// 위는 클래스로도 가능

// convenience initializer
// 조건 : 다른 init을 반드시 실행
// 클래스에서만 convenience init 가능
class Profile {
    var name:String
    var age:Int
    var isAdult:Bool
    
    init(name:String,age:Int){
        self.name = name
        self.age = age
        self.isAdult = age > 19 ? true : false
    }
    
//    init(age:Int){
//        self.name = "기본이름"
//        self.age = age
//        self.isAdult = age > 19 ? true : false
//    }
    
    // 위의 주석과 같은 기능
    // 최상위의 init을 가져와서 재활용 (반드시 하나의 init을 호출해야함)
    convenience init(age:Int) {
        self.init(name: "기본이름", age: age)
    }
    
    func test(){
        print(name)
    }
    
}

// 상속
class MemberProfile:Profile {
    
    // override : 재정의
    override init(name: String, age: Int) {
        let newName = name + "님"
        super.init(name: newName, age: age) //  부모 클래스의 init울 호출
    }
    
    override func test(){
        print(name + " 하이")
    }
    
}

let memeber = MemberProfile(name: "jeonyul", age: 30)
let memeber2 = MemberProfile(age: 30)
memeber.test()
memeber2.test()
 
// Required init : 반드시 구현해야하는 초기값 : 반드시 구현하거나 호출해야한다.
// 상속인 경우에 해당
class BaseView {
    
    // CGRect : x,y,width,height
    init(frame:CGRect){
        
    }
    
    // NSCoder : ui를 gui로 만든다.
    required init(coder:NSCoder){
        print("=====")

    }
}

class RedView:BaseView {
    
    init() {
        let frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        let frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        print("-----")
        super.init(coder: coder)
        print("-----")
    }
}
RedView(coder: NSCoder())


// failable initalizer : ?
// init? : 실패해서 nil이 될 수 있다.

class MyClass {
    // 왜 쓰냐? : 특정한 조건이 만족했을 때만 사용할 수 있도록한다.
    init?(type:String){
        if type == "" {
            return nil
        }
        print("success", type)
    }
}

let myClass = MyClass(type: "test")
let myClass2 = MyClass(type: "")
