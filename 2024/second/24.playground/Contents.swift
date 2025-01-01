import UIKit

// func type

func sayHello() -> Void {
    print("hello")
}

sayHello // ()->()

func plus(_ a: Int, _ b:Int) ->Int {
    return a + b
}

func minus(_ a: Int, _ b:Int) ->Int {
    return a - b
}


plus // (Int, Int) -> Int
minus // (Int, Int) -> Int

func onPress(_ button:String){
    if button == "+" {
        plus(1, 2)
    }
    if button == "-" {
        minus(2, 1)
    }
    
}


var calcType:((Int,Int)->Int)?

func onPress2(_ button:String){
    if button == "+" {
        calcType = plus
    }
    if button == "-" {
        calcType = minus
    }
}

func showResult() -> Int {
    calcType?(2,2)
}

showResult()
