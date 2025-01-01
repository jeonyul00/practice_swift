import UIKit

// optional


// 옵셔널로 래핑되어있다 -> 어떠한 기능들을 사용하려면 언래핑해야한다.
var myAge:Int? = 20
var myAge2:Optional<Int> = 20

myAge == myAge2 // true

// x : Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
// var sum = myAge + 1

// 강제 언래핑
var sum = myAge! + 1 // myAge에 값이 무조건 있다 => ! , 없으면 error

// nil coalesciong
var sum2 = (myAge ?? 0) + 1

// if let || guard는 다음 영상에서-
