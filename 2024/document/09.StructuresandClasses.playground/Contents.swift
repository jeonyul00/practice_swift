import UIKit

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var videoMode = VideoMode()
videoMode.resolution.height = 10
var videoMode2 = VideoMode()
videoMode2.resolution.height

// 구조체와 열거형은 값 타입
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd // 값 타입
cinema.width = 2048
print(hd.width)
print(cinema.width)

// 클래스는 참조 타입 (Classes Are Reference Types)
// 이 개념 모르면 개발 그만해.

// 식별 연산자
// 클래스는 참조 타입이기 때문에 클래스의 같은 단일 인스턴스에 참조하는 여러개의 상수와 변수가 가능합니다 (구조체와 열거형은 상수 또는 변수 또는 함수에 전달할 때 항상 복사되기 때문에 클래스와 같지 않습니다).

// 동일 인스턴스 (Identical to) (===)
// 동일하지 않은 인스턴스 (Not identical to) (!==)
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

if tenEighty === alsoTenEighty {
    print("같은 값을 참조 === ")
}
