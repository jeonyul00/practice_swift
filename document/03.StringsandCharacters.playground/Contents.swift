import UIKit

// 빈 문자열 초기화 (Initializing an Empty String)
var emptyString = ""
var anotherEmptyString = String()
if anotherEmptyString.isEmpty {
    anotherEmptyString = "String"
}
anotherEmptyString += " add~"
anotherEmptyString
let char:[Character] = ["ㅗ", "ㅏ","ㅜ"]
let merged = String(char)
merged

print(#"6 times 7 is \#(6 * 7)."#)
print("6 times 7 is \(6 * 7).")

// 문자열 인덱스
// 각 String 값은 문자열에 각 Character 의 위치에 해당하는 String.Index 인 인덱스 타입 (index type) 을 가지고 있습니다.
let greeting = "123456789"
greeting[greeting.index(greeting.startIndex, offsetBy: 7)]
greeting[greeting.index(greeting.startIndex, offsetBy: greeting.count - 1)]
greeting.index(greeting.startIndex, offsetBy: greeting.count)
var str:String = "123456789"
str[str.index(str.startIndex, offsetBy:str.count - 1 )]
// 왜 이렇게까지 해야하냐? -> 문자마다 저장할 메모리 양이 다를 수 있으므로 특정 위치에 있는 Character 를 확인하려면 해당 String 의 시작 또는 끝에서 각 유니코드 스칼라를 반복해야 합니다. 이러한 이유로 Swift 문자열은 정수값으로 인덱스를 생성할 수 없습니다.
str.insert("N", at: str.startIndex)
str.insert(contentsOf:"ew Value ", at: str.index(str.startIndex, offsetBy: 1))
str

// 부분 문자열
let index = str.firstIndex(of:" ")
str[..<index!]

