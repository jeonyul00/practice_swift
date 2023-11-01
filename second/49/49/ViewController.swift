//
//  ViewController.swift
//  49
//
//  Created by 전율 on 2023/11/01.
//

import UIKit


// data race : 작업을 여러번 하는 중 크래시가 나거나 어떠한 경우때문에 작업 중 몇 개가 누락되거나 하는 경우 => actor로 해결가능
class ViewController: UIViewController {

    var userInfo = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            addName()
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            Task {
                print(await self.userInfo.names)
            }
            
        }
        
    }
    
    func addName(){
        DispatchQueue.global().async { // 이걸 안 기다려주네 => actor로 만들고 await 키워드 붙여서 사용
            Task{
                await self.userInfo.appendName()
            }
            
        }
    }

}

// actor : 쓰레드 환경에서 안전하게 작동되도록하는 구조 : 클래스와 유사한 형태
// 상속 안됨, 확장은 가능
actor UserInfo {
    var names = [String]()
    
    // actor에서 쓰레드와 상관없는 값을 사용하고 싶으면? : nonisolated 붙이기
    nonisolated var age:Int {
        return 20
    }
    nonisolated let name = "jeonyul"
    
    // x : some이 언제든 바뀔 수 있기 때문에
    // nonisolated var some = 20
    
    func appendName(){
        names.append("kim")
        print("append done")
    }
}
