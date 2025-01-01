import UIKit

// type
var str = "string" // 초기값을 보고 타입 추론함
var str2: String = "string" // 명시
print(type(of: str)) // String
print(type(of: str2)) // String

let num: Int = 1
let num2 = 1
// 컨벤션 따라 갈 것

let pi = 3.14
print(type(of: pi)) // Double -> 왜 Float는 아니지
let pi2:Float = 3.14
print(type(of: pi2)) // Float

/*
 Swift에서는 소수점이 포함된 숫자를 기본적으로 Double로 처리합니다. 이는 Double이 Float보다 더 높은 정밀도를 제공하며, 대부분의 현대적인 컴퓨터에서 효율적으로 작동하기 때문입니다.
 Double은 64비트 부동소수점 타입으로, 정밀도가 높아 더 많은 소수점 자리수를 정확히 표현할 수 있습니다.
 Float은 32비트 부동소수점 타입으로, 정밀도가 낮아 적은 메모리를 사용할 때 유용합니다. 그러나 대부분의 경우 Double을 사용하는 것이 안전합니다.
 */
let char = "A"
print(type(of: char)) // String -> 왜? Character로 추론 안하지?
let char2:Character = "A"
print(type(of: char2)) // Character

/*
 Swift에서는 문자열 리터럴("A")을 기본적으로 String 타입으로 추론합니다. 이는 단일 문자의 리터럴도 String으로 취급되기 때문입니다.
 유연성: String은 단일 문자뿐만 아니라 여러 문자로 구성된 문자열을 처리할 수 있어 더 일반적으로 사용됩니다.
 편의성: 대부분의 경우, 문자열을 다룰 때 String이 더 유용합니다. 따라서 Swift는 프로그래머의 의도를 고려해 문자열 리터럴을 기본적으로 String으로 처리합니다.
 */
