//
//  ViewController.swift
//  17.Concurrency
//
//  Created by 전율 on 7/1/24.
//

import UIKit

// actor
// 쓰레드 환경에서 안전하게 작동되도록 한다. -> class와 유사한 형태로 만들 수 있다.
// 상속 안됨, 확장 가능

class ViewController: UIViewController {
    
    var userInfo = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...100 {
            addName()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            Task{
                print("names :", await self.userInfo.names)
                print("count :", await self.userInfo.names.count)
            }
        }
    }
    
    func addName() {
        DispatchQueue.global().async {
            Task {
                await self.userInfo.appendName()
            }
        }
    }
}

// actor: 쓰레드 세이프하게 작동
actor UserInfo {
    var names = [String]()
    
    // nonisolated: 얘는 쓰레드와 관계없이 그냥 사용하고 싶다.
    nonisolated var age:Int {
        return 20
    }
    
    func appendName(){
        names.append("kim")
        print("append done")
    }
}

