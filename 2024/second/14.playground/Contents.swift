import UIKit

// option type
// 값이 있을수도 있고 없을수도 있다.
var age1:Int = 0
var age2:Int? = nil // 메모리에 올라가지 않음

var str1:String = ""
var str2:String? = nil
var str3:String?

str2 == str3 // true

var arr:Array<String>? = []
arr
arr?.append("append")
arr
