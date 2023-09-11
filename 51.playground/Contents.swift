import UIKit

// defer : 가장 마지막에 실행되는 코드블럭 => func 안에다가 씀 뭐야 클로저 같은건가

func test(a:Int) {
    
    var aa = a
    
    aa = aa + 10
    
    // 이 로직은 무조건 마지막에 실행되어야 한다. => 원래 마지막에 실행되지 않나? : 버그 방지로 쓴단다. 어따써도 마지막에 실행됨
    // defer로 감싸면 된대 : defer 전에 return을 만나면 실행 안됨 : 당연한거지
    defer {
        aa = aa * 10
    }
    
    // defer가 여러개면? : defer : '마지막에 실행해라'니까 밑에부터 실행됨 : c, b, a
    defer {
        print("a")
    }
    
    defer {
        print("b")
    }
    
    defer {
        print("c")
    }
    
    aa = aa + 20
    
}
