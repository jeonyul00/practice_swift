import UIKit

// string type
var greetiong = "hello\nworld"
print(greetiong)

greetiong =
"""
마치 파이썬 같네요
줄

넘
\n
김
"""
print(greetiong)

var testValue = "\"\"\"\n\t\""
print(testValue)

greetiong = "hello "
greetiong = greetiong + "swift"
print(greetiong)

greetiong.count
greetiong.lowercased() // 원본 데이터를 바꾸지 않음
var upperValue = greetiong.uppercased() // 원본 데이터를 바꾸지 않음
upperValue
greetiong.isEmpty
greetiong.isEmpty == false

greetiong.append(" add original data") // 원본 데이터를 바꿈
greetiong

// dropLast() & dropFirst() : 원본 데이터를 바꾸지 않음
greetiong.dropLast()
greetiong

greetiong.dropLast().dropLast().dropLast()
greetiong

greetiong.dropLast(3)
greetiong

greetiong.hasPrefix("h") // 시작 글자 boolean
greetiong.hasSuffix("x") // 끝 글자 boolean
greetiong.contains("add") // 포함 여부 boolean

// 요딴식으로 쓸 수 있겠다
var isProtocol = greetiong.hasPrefix("http//:")
var isWindowFile = greetiong.hasSuffix(".exe")

