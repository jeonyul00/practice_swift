import UIKit

// controll flow

// switch case

var num = 3

switch num {
case 3:
    print("num is 3")
case 10:
    print("num is 10")
default:
    print("etc")
}


let media = ("abc", 10)

switch media {
case let (str,_):
    print(str)
}
