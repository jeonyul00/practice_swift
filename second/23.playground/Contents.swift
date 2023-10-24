import UIKit

// func

func presentMyScore(_ score:Int) -> Int {
    print(score.description + "점-")
    return score
}

presentMyScore(10)

func exFunc() -> (num:Int, str:String) {
    return (50,"str")
}

exFunc().num


// inout
var num = 0
func inOutEx(_ int: inout Int){ // 원본을 바꿈
    int += 5
}
num
inOutEx(&num)
num
inOutEx(&num)
num
inOutEx(&num)
num
inOutEx(&num)
num
