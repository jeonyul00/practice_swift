import UIKit

/*
    변수
*/

var score = 1
var score2:Int = 1
var score3:Int?

score = 10

// 오 이건 되네?
let score4:Int? // nil
score4 = 1

let score5 = 1
// x : Cannot assign to value: 'score5' is a 'let' constant
// score5 = 2

// todo: 상수여도 nil에서 값 넣는건 할 수 있는건가?
let name:String?
name = "jeonyul"

let name2:String = "yul"
// x : Cannot assign to value: 'name2' is a 'let' constant
// name2 = "jeonyul"

let some:Int?
type(of: some)
