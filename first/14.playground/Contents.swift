import UIKit

// Optional Type
// js의 옵셔널이랑 같은 개념 => 주의 : undefined아니고 nil, null아니고 nil
// 주의! => 빈 값과 nil은 다름

var age1: Int = 0
var age2: Int? = 0
var age3: Int? = nil

var str: String? = ""
str?.isEmpty
var str2: String? = nil
str2?.isEmpty

var myFavorite:[String]? // 빈 배열과 nil은 다름
myFavorite?.isEmpty == true // false
if myFavorite == nil {
    print("is nil")
}

if myFavorite?.isEmpty == true {
    print("is empty")
}

