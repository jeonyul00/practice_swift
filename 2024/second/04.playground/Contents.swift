import UIKit

/*
    boolean
*/


var isTop = false
isTop = true

// x : Type 'Int' cannot be used as a boolean; test for '!= 0' instead
// isTop = 1

var hasColor = true
hasColor = "red".contains("re")
hasColor

var isTrue = true
isTrue = 1 > 2
isTrue = !false

isTrue = !isTrue
isTrue.toggle() // 원본을 바꿈
isTrue.toggle()

if isTrue {
    print("true")
} else if !isTrue {
    print("false")
}
