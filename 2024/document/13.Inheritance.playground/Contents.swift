import UIKit

// 상속
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {

    }
}

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

// Overriding: 하위 클래스는 상위 클래스에서 상속할 인스턴스 메서드, 타입 메서드, 인스턴스 프로퍼티, 타입 프로퍼티, 또는 서브 스크립트 자체 사용자 구현을 제공할 수 있습니다. 이것을 재정의 (overriding) 라고 합니다.

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// 프로퍼티 재정의 (Overriding Properties)
// 프로퍼티에 고유한 사용자 정의 getter와 setter를 제공하거나 기본 프로퍼티 값이 변경될 때 재정의 한 프로퍼티가 관찰할 수 있도록 프로퍼티 관찰자를 추가 하기위해 상속된 인스턴스 또는 타입 프로퍼티를 재정의할 수 있습니다.
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

// final 표시를 통해 실수로 메서드, 프로퍼티, 또는 서브 스크립트를 재정의 하는 것을 방지할 수 있습니다. 재정의를 방지하려면 메서드, 프로퍼티, 또는 서브 스크립트의 키워드 전에 final 수정자를 작성합니다
