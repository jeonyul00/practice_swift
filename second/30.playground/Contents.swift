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

var score1 = Score1(myScore: 0, yourScore: 0)
score1.myScore = 100
score1.presentScore()

// 이러면 class랑 뭐가달라
// 1. 초기값 세팅하는 과정 : struct는 init을 명시하지 않음(자동으로 제공함), init => 생성자역할인가

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

var score2 = Score2(myScore: 0, yourScore: 0)
score2.myScore = 1000
score2.presentScore()
