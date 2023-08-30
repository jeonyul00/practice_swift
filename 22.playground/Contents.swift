import UIKit

// controll flow
// swich case
// 조건 따라

var number = 2

switch number {
case 3...:
    print("3 이상")
    break
case 2..<3:
    print("3 미만 1 초과")
    break
case 1...2:
    print("1과 2이지만 위에서 2가 걸림 => 1")
    break
case 0, -1:
    print("0 || -1 ")
    break
default:
    print("-1을 제외한 음수")
}


// let 사용
let media = ("abc", 180)
switch media {
case let (title, length):
    print("제목 : ", title)
    print("길이 : ", length)
    break
}
