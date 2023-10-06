import UIKit

// deinit : 초기화 해제

// class 전용
class Test {
    init(){
        print("init!")
    }
    
    deinit {
        // 이 클래스가 메모리에서 해제 됐을 때 호출
        print("de init")
    }
}

// 레퍼런스 타입은 참조하고 있는 것들의 카운트(레퍼런스카운트)가 0이 될 때 메모리에서 해제 됨 : 이것이 자바와 가장 큰 차이 같다.
var test1:Test? = Test() // 레퍼런스 카운트 : 1
var test2:Test? = test1 // 레퍼런스 카운트 : 2
var test3:Test? = test1 // 레퍼런스 카운트 : 3

// 위의 3개 변수의 참조(레퍼런스 타입)를 전부 끊어내야 메모리에서 해제됨
test1 = Test()
test2 = Test()
test3 = Test()
// 이러면, 덮어쓰여지는 방식이라서 맨 처음 Test()의 연결이 끊어지고 새로운 Test()를 참조

// 옵셔널 타입이라면 nil로 참조 해제
test1 = nil
test2 = nil
test3 = nil

// ex
class Bank {
    static var coin:Int = 500
}

class Player {
    var coin: Int
    init(coin:Int){
        self.coin = coin
    }
    
    func Plus(){
        self.coin += 100
    }
    
    // 메모리 해제되는 시점
    deinit {
        Bank.coin += self.coin
    }
}


var player1: Player? = Player(coin: 100)
var player2: Player? = Player(coin: 100)

player1?.Plus()
player1?.Plus()

player2?.Plus()

Bank.coin

player1 = nil

Bank.coin
