import UIKit

/*
    string
*/

print("hello\nworld")

var greeting = ""

greeting =
"""
문자열을 쓰는데 큰따옵표 3개 사이에 쓰면 그 구조 그대로 가지게 됩니다.
    특히나 탭과 엔터를 그대로 가지게 됩니다.
이 안에서 큰 따옴표룰 쓰고 싶다면 \"이렇게쓰면 됩니다.\"
"""

print(greeting)
greeting = "welcome swift " + greeting
print(greeting)


let str = "HELLO world"
// 여기서 중요한 것은 원본을 제어하는가 안 하는가
let upperCaseStr = str.uppercased() // 대문자로 반환
let lowCaseStr = str.lowercased() // 소문자로 반환
str.count // 글자 수
str.capitalized // 첫 글자만 대문자로 바꿈
str.dropFirst() // 첫 글자를 버림
str.dropLast() // 마지막 글자 버림
str.hasPrefix("H") // bool 반환, 첫 글자가 이거 맞냐
str.hasPrefix("HE")
str.hasPrefix("") // todo: 이게 왜 true => 빈 문자열("")은 모든 문자열의 접두사로 간주됩니다.

str.hasSuffix("d") // bool 반환, 마지막 글자가 이거 맞냐
str.hasSuffix("") // todo: 이게 왜 true? => 빈 문자열 ("")은 모든 문자열의 접미사로도 간주됩니다.

str.contains("HELLO") // todo: 포함되어있냐?
str.contains(" ")
str.contains("") // todo: 이건 또 왜 false => contains 메서드는 빈 문자열을 포함하지 않은 것으로 간주합니다.
