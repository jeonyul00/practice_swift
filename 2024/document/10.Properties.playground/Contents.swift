import UIKit

/*
 프로퍼티 (Properties) 는 값을 특정 클래스, 구조체, 또는 열거형을 연결합니다.
 저장된 프로퍼티 (Stored properties)는 인스턴스의 일부로 상수와 변수 값을 저장하는 반면에 계산된 프로퍼티 (computed properties)는 값을 저장하는 대신에 계산합니다.
 계산된 프로퍼티 (Computed properties)는 클래스, 구조체, 그리고 열거형에 의해 제공됩니다. 저장된 프로퍼티는 클래스와 구조체에 의해서만 제공됩니다.
 */

// Stored Properties: 객체의 일부로 실제 값을 저장하는 프로퍼티입니다.
class JuiceBottle {
    var juiceVolume: Double // 저장된 프로퍼티
    init(juiceVolume: Double) {
        self.juiceVolume = juiceVolume
    }
}

let appleJuice = JuiceBottle(juiceVolume: 1.0) // 1리터의 사과 주스
print(appleJuice.juiceVolume) // 1.0 출력

// Computed Properties : 실제 값을 저장하지 않고, 다른 프로퍼티의 값에 의존하여 계산되는 값을 반환하는 프로퍼티입니다.
// 저장된 프로퍼티 외에도 클래스, 구조체, 그리고 열거형은 값을 실질적으로 저장하지 않는 계산된 프로퍼티 (computed properties) 를 정의할 수 있습니다. 대신 다른 프로퍼티와 값을 간접적으로 조회하고 설정하는 getter와 옵셔널 setter를 제공합니다.
class AppleJuiceRecipe {
    var numberOfApples: Int // 사과 개수 (저장된 프로퍼티)
    
    // 사과 한 개당 0.4리터의 주스를 만들 수 있다고 가정
    var juiceVolume: Double { // 계산된 프로퍼티
        return Double(numberOfApples) * 0.4
    }
    
    init(numberOfApples: Int) {
        self.numberOfApples = numberOfApples
    }
}

let recipe = AppleJuiceRecipe(numberOfApples: 5) // 5개의 사과로 사과 주스 만들기
print(recipe.juiceVolume) // 2.0 출력 (5 * 0.4 = 2)

// -----
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// 짧은 setter: 계산된 프로퍼티의 setter가 새로운 값을 설정하는데 이름을 정의하지 않았다면 newValue 라는 기본 이름이 사용됩니다. 다음은 이러한 짧은 표현의 이점을 가지는 Rect 구조체를 나타냅니다:
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
// 짧은 getter: getter의 전체 본문이 단일 표현식이라면 getter는 암시적으로 표현식을 반환합니다. 다음은 짧은 getter와 setter의 이점을 가진 Rect 구조체를 나타냅니다:
struct CompactRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + (size.width / 2),
                  y: origin.y + (size.height / 2))
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// readOnly
// setter가 없고 getter만 있는 계산된 프로퍼티는 읽기전용 계산된 프로퍼티 (read-only computed property) 라고 합니다. 읽기전용 계산된 프로퍼티는 항상 값을 반환하고 점 구문으로 접근할 수 있지만 다른 값을 설정할 수 없습니다.
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// Property Observers: 프로퍼티 관찰자는 프로퍼티의 현재 값이 새로운 값과 같더라도 프로퍼티의 값이 설정될 때 호출됩니다.
// willSet, didSet
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
