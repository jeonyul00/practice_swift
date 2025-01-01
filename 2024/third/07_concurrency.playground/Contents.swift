import UIKit

// actor : 멀티 스레드 환경에서 좀 더 안전하게 작동되도록 만들어지는 구조, 몇 번 접근하든 안전하게 처리해줌
// 상속 안됨, 확장은 됨
actor UserInfo {
    var names:Array<String> = []
    // 액터 내에서 쓰레드랑 관계없이 사용하겠다.
    nonisolated var age:Int {
        return 1
    }
    
    func appendName() {
        names.append("jeonyul")
        print("append done")
    }
    
}

var userInfo = UserInfo()

func addName(){
    DispatchQueue.global().async {
        Task{
            await userInfo.appendName()
        }        
    }
}

addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
addName()
