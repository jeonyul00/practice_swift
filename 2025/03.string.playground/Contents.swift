import UIKit

// String: 문자열
var str: String

str =
"""
    이것은 JS의 백틱과 같은 역할-
    그럼 스페셜 캐릭터 있나? \n 되나여? 되네요
    \"큰따옴표 쓰기\"
"""
print(str)

var str2: String = #"te\nst"#
var str3: String = "te\nst"
print(str2)
print(str3)

str = str + " 짠!"
print(str)

str.isEmpty
str.count
str.uppercased() // 새로운 문자열 반환임, 기존 데이터는 유지
str.lowercased()

let index = str3.startIndex
str3[index]

let dropFistStr:Substring = str3.dropFirst() // 기존 데이터 유지, 새로운 문자열 반환
print("dropFistStr ::: ",dropFistStr)

let str4: String = "1234"
str4.hasPrefix("1") // true
str4.hasSuffix("4") // true

let url:String = "https://test.com"

if url.hasPrefix("http") && url.hasSuffix("com") {
    print("ok")
}

url.contains("te")
