import UIKit

// static
// 하나의 원본으로서 자리잡는 값 ,이 지랄로 설명하네; => 빌드 시 가장 먼저 data 메모리에 올라감 모두가 이 값을 바라봄 => 오 여기선 아예 다른 변수에서 가져올 수도 없음

class Bank {
     var coin: Int = 0
}

var bank1 = Bank()
var bank2 = Bank()
var bank3 = Bank()
var test4 = bank3

bank1.coin = 100
bank2.coin = 200
bank3.coin = 300
test4.coin = 400

// 별 개의 값
bank1.coin
bank2.coin
bank3.coin


class StaticBank {
     static var coin: Int = 0
}

var staticBank1 = StaticBank()
// x : 접근 자체가 안됨
// staticBank1.coin

StaticBank.coin = 1000
StaticBank.coin

class Player {
    func plus(){
        StaticBank.coin += 1
    }
    func minus(){
        StaticBank.coin -= 1
    }
}

let player1 = Player()
let player2 = Player()
let player3 = Player()

player1.plus()
player2.plus()
player3.plus()

// 이러한 점 때문에 static을 전역 변수처럼 쓰는거지, 전역변수 !== static ㅇㅋ? static으로 전역 변수도 만들 수 있는거지
StaticBank.coin

