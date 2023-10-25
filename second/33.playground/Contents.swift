import UIKit

// static

class Bank {
    static var coin: Int = 0
    var coin2: Int = 0
}

var bank1 = Bank()
bank1.coin2 = 10
var bank2 = Bank()
bank2.coin2 = 100
var bank3 = Bank()
bank3.coin2 = 1000

bank1.coin2
bank2.coin2
bank3.coin2
// 이러면 문제가 생기지, 유일한 글로벌 변수가 필요한거지

Bank.coin = 10
Bank.coin = 100
Bank.coin = 1000
Bank.coin

class Player {
    func plus() {
        Bank.coin += 1
    }
    func minus() {
        Bank.coin -= 1
    }
}


var p1 = Player()
var p2 = Player()
var p3 = Player()
p1.plus()
p3.plus()
p2.plus()
Bank.coin
