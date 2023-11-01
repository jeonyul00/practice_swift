import UIKit

// defer : 가장 마지막에 실행되는 코드 블럭
func testFunc(){
    print("처음 실행")
        
    // 이 로직은 무조건 제일 마지막에 해야한다면?
    defer { // 대기
        print("마지막 실행 => 그렇기 때문에 defer은 마지막 줄에 쓸 필요가없다. 그러면 경고 뜸")
    }
    
    defer { // 대기
        print("마지막 실행2 => 그렇기 때문에 defer은 마지막 줄에 쓸 필요가없다. 그러면 경고 뜸")
    }
    
    defer { // 대기 -> 끝까지 왔다? 여기부터 실행
        print("마지막 실행3 => 그렇기 때문에 defer은 마지막 줄에 쓸 필요가없다. 그러면 경고 뜸")
    }
    
    print("두번쨰 실행")
    
}

testFunc()
