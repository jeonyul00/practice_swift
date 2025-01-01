import UIKit

// unicode
// 문자 -> 내부적으로 특정한 코드값 (16진수)


"a"
"\u{61}"
"a" == "\u{61}"

// 숫자만 입력
let inputValue = "4"

if inputValue >= "\u{30}" && inputValue <= "\u{39}" {
    print("숫자다 ::: ",inputValue)
}

let a = UnicodeScalar("가") // 10진수로 변환
String(44032, radix: 16) // 16진수로 변환
