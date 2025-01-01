import UIKit

/*
 초기화 해제 구문 (deinitializer) 는 클래스 인스턴스가 할당 해제되기 직전에 호출됩니다. 초기화 구문은 init 키워드로 작성하는 것과 유사하게 초기화 해제는 deinit 키워드로 작성합니다. 초기화 해제는 클래스 타입에서만 사용 가능합니다.
 Swift는 더이상 필요하지 않을 때 자원 확보를 위해 인스턴스를 자동으로 할당 해제합니다
 클래스 초기화 해제는 클래스 당 하나의 초기화 해제 구문만 가지고 있습니다. 이 초기화 해제 구문은 파라미터가 없고 소괄호 없이 작성됩니다:
 */

class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested:Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
var playerOne: Player? = Player(coins: 0)
playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank) coins")
