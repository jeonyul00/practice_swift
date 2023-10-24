import UIKit

// class vs struct (구조체)
struct Score1 {
    var myScore:Int
    var yourScore:Int
    var otherScore:Int = 0
    
    func presentScore(){
        print(myScore, yourScore)
    }
}

var score1 = Score1(myScore: 10, yourScore: 20)
score1.myScore

var scoreA = score1 // 값 새로운
var scoreB = scoreA // 값 새로운

score1.myScore = 11
score1.myScore
scoreB.myScore

// 이러면 class랑 뭐가달라
// 1. 초기값 세팅하는 과정 : struct는 init을 명시하지 않음(자동으로 제공함), init => 생성자역할인가
// 2. struct는 값 타입, class는 참조타입

class Score2 {
    var myScore:Int
    var yourScore:Int
    var otherScore:Int = 0
    
    init(myScore:Int, yourScore:Int){
        self.myScore = myScore
        self.yourScore = yourScore
    }
    
    func presentScore(){
        print(myScore, yourScore)
    }
}

var score2 = Score2(myScore: 10, yourScore: 20)
var scoreAA = score2
var scoreBB = scoreAA
score2.myScore = 100
scoreBB.myScore
