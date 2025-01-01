import UIKit

// Optional2

// 문법, unwrapping
// 이 상태는 Optional로 wrapping 되어있는 것 : 추 후 Optional을 벗겨낼 수 있는 건가? ㅇㅇ맞네
var myAge: Int? = 29
var myAge2: Optional<Int> = 29

// x : Binary operator '+' cannot be applied to two 'Int?' operands : 반드시 옵셔널을 제거해야한다.
// var sum = myAge + myAge2

// force unwrapping 강제 언래핑 : 옵셔널 값이 nil인 경우에서 강제 언래핑하는 로직이 있는 상태에서 앱을 돌릴 시 error => 앱이 죽음
var sum = myAge! + myAge2!
sum


// nil coalescing : ?? : nil이면 뒤의 값 nil이 아니면 변수 값
var sum2 = (myAge ?? 0) + (myAge2 ?? 0)
sum2
