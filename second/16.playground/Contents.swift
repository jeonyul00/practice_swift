import UIKit

// optional
var myAge:Int? = 18
var myAge2:Optional<Int> = 18
var sum:Int = 0

// if let : 값이 있으면 내부 로직 ㄱ
if let age = myAge {
    sum += age
}
sum

// guard let : 값이 없으면 내부 로직 ㄱ
guard let age = myAge else {
    // 중단
    // return
    fatalError("myAge 값이 없음")
}
sum += age
sum
