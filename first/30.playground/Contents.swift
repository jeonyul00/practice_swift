import UIKit

// Class vs struct 구조체

struct Score1 {
    var myScore:Int
    var yourScore:Int
    
    func presentScore(){
        print(myScore, yourScore)
    }
}

class Score2 {
    var myScore:Int
    var yourScore:Int

    init(myScore:Int, yourScore:Int){
        self.myScore = myScore
        self.yourScore = yourScore
    }
    
    func presentScore(){
        print(myScore, yourScore)
    }
}

// 아니 이러면 클래스랑 뭐가 다르냐? -> class는 참조 타입 struct는 원시 타입(value type) : 그럼 struct 인스턴스는 메모리 해제 안해도 되나?
// 초기값 할당은? -> class는 생성자(init(){}) 필요, struct는 자동으로 만들어줌 롬복같네

// sturuct : stack :  메모리 관리 필요 x
var score1 = Score1(myScore: 0, yourScore: 0)
score1.myScore = 100
score1.presentScore()


// value type이기 때문에 프로퍼티도 각 자 복사한 값
var scoreA = score1
scoreA.myScore = 50
scoreA.myScore
var scoreB = score1
scoreB.myScore



// class : heap : 메모리 관리 필
var score2 = Score2(myScore: 0, yourScore: 0)
score2.myScore = 100
score2.presentScore()

var scoreAA = score2
scoreAA.myScore = 10
var scoreBB = score2
scoreBB.myScore


// 메모리 영역s
// 1. Text Segment : 실제 작성한 코드가 올라가는 영역
// 2. Data Segment : 글로벌한 값들이 올라가는 영역 라이프 사이클 중 가장 먼저 올라가며 가장 늦게 내려감: static 등
// 3. Stack Segment : 메모리 관리 자동, 크기 작음, 빠름, LIFO 구조
// 4. Heap Segment : 메모리 관리 필, 큼, 상대적으로 느림, TREE 구조
