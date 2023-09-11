//
//  ViewController.swift
//  49
//
//  Created by 전율 on 2023/09/11.
//

import UIKit


// actor : 쓰레드 환경에서 안전하게 작동되도록 만들어지는 구조
// class와 유사한 형태를 만들 수 있다.
// 상속 불가, extension 가능
actor UserInfo {
    
    var names = [String]()
    // nonisolated : 쓰레드와 관계없이 사용하려면 명시, 상수만 가능
    nonisolated let myName = "jeonyul"
    
    func appendName() -> Void {
        names.append("kim")
        print("append done")
    }
}

// main
class ViewController: UIViewController {
    
    var userInfo = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addName()
        addName()
        addName()
        addName()
                
        // ["kim"] : 여러번 append 했는데도 1개만 들어감 이것이 data race => class를 actor로 만들면 된다. 근데 그럼 이 전에는 안됐냐? -> js에서 반복문에서 비동기 돌릴 때 처럼 할 수 있었겠지
        // async await 명시
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            Task{
                print(await self.userInfo.names)
            }
        }

    }
    
    func addName() {
        DispatchQueue.global().async {
            Task{
                await self.userInfo.appendName()
            }
        }
    }

}
