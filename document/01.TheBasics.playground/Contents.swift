import UIKit

/* ---------- 상수와 변수 ---------- */
// 상수와 변수는 사용하기 전에 반드시 선언이 되어야 합니다. -> "할당"아님, 선언
var environment = "development"
let maximumNumberOfLoginAttempts: Int // 선언만 함

if environment == "development" {
    maximumNumberOfLoginAttempts = 100 // 할당
} else {
    maximumNumberOfLoginAttempts = 10 // 할당
}

// 여러개의 상수 또는 여러개의 변수를 선언할 때 콤마로 구분하여 한줄로 선언이 가능합니다
var x = 0.0, y = 0.0, z = 0.0
var red, green, blue: Double
let n = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// Swift 키워드와 동일한 이름의 상수 또는 변수를 제공해야 한다면 이름을 백틱 (`)으로 묶어야 합니다. 그러나 선택의 여지가 없을때까지는 키워드를 이름으로 사용하지 말아야 합니다.
let `static` = "static" // 오 이게 되네

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8

// Double 은 64-bit 부동 소수점 숫자를 표기
// Float 는 32-bit 부동 소수점 숫자를 표기

// Int는 부호 있는 정수(signed integer)를 나타냅니다. 즉, 양수, 0, 음수를 모두 포함할 수 있습니다.
// UInt는 부호 없는 정수(unsigned integer)를 나타냅니다. 즉, 오직 양수와 0만 포함할 수 있습니다. 음수는 포함할 수 없습니다.

// 별칭
typealias yul = String
typealias jeon = Int8
let str:yul = "11"
let num = jeon.min

// tuple
// 여러값을 단일 복합 값으로 그룹화 합니다. 튜플안에 값은 어떠한 타입도 가능하며 서로 같은 타입일 필요는 없습니다.
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
let http500Error = (code:500, msg:"server Error")
let (code, msg) = http500Error
http500Error.code
code

// 옵셔널 체이닝 + 옵셔널 바인딩
let myNumber:Int? = 0
if let myNumber = myNumber {
    print("My number is \(myNumber)")
}
// 이것도 됨 => 구조분해 할당같다.
if let myNumber {
    print("My number is \(myNumber)")
}

// 필요한 경우 if 구문에 쉼표로 구분하여 옵셔널 바인딩 및 부울 조건을 여러개 포함할 수 있습니다.
// 옵셔널 바인딩 값 중 하나가 nil 이거나 부울 조건이 false 로 판단되면 전체 if 구문의 조건은 false 로 간주됩니다.
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

// 에러처리
// 값의 존재 유무를 사용하여 함수의 성공 또는 실패를 전달할 수 있는 옵셔널과 달리 에러 처리를 사용하면 에러 원인을 판별하고 필요한 경우 에러를 프로그램의 다른 부분으로 전파 할 수 있습니다.
func canThrowAnError() throws {

}

do {
    try canThrowAnError()
} catch {
    
}
