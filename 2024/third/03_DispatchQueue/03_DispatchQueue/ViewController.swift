//
//  ViewController.swift
//  03_DispatchQueue
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { time in
            let now = Date()
            let dateString = dateFormatter.string(from: now)
            self.timeLabel.text = dateString
        }
    }
    
    /*
     serial (직렬처리): 순차적으로 작업
     
     theadA : --- 1 ---
     theadA :          ----- 2 -----
     theadA :                       --- 3 ---
     
     concurrent (병렬처리) :
     
     theadA : --- 1 ---
     theadA : ----- 2 -----
     theadA : --- 3 ---
     
     async (비동기처리) :
     
     theadA : --- 1 ---
     theadB : ----- 2 -----
     theadC : --- 3 ---
     
     sync (동기처리) :
     
     theadA : --- 1 ---
     theadB :          ----- 2 -----
     theadC :                       --- 3 ---
     
     
     --- 스펙 ---
     main thread의 작업 방식은 serial
     UI 처리는 반드시 main thread가 해야한다.
     일반적으로 작성한 코드의 흐름은 main thread가 작업한다.
     
     --- 중요 ---
     Sync != Serial
     Async != Concurrent
     Sync는 앞 작업과 뒷 작업의 연관성에는 상관이 없다. =>  '단일 작업'에 대한 특성을 지칭, 따라서 앞 작업이 Sync라 해도, 뒷 작업은 Async일 수도 있다.
     앞 작업과 뒷 작업을 '순차적'으로 실행시킬지 말지 정하는게 Serial & Concurrent 개념인 것
     
     */
    
    // 버튼을 눌렀을 때 겁나 오래걸리는 작업이 실행
    @IBAction func onPress(_ sender: Any) {
        
        // 여기서 queue는 concurrent하지 concurrent한 queue 내에서 async를 쓴거지 => 비동기 처리를 병렬적으로 실행한 것
        // 만약 queue가 serial이면? => 비동기 처리 하나가 먼저 되고 그 다음 비동기가 되고 이런거지
        let queue = DispatchQueue(label: "myQueue", attributes: .concurrent) // concurrent한 queue 생성, 기본값이 serial
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 오래 걸리는 작업이라고 하자 1초 걸림
            print("끝1")
        }
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 오래 걸리는 작업이라고 하자 1초 걸림
            print("끝2")
        }
        queue.async {
            Thread.sleep(forTimeInterval: 1) // 오래 걸리는 작업이라고 하자 1초 걸림
            print("끝3")
        }
        
        // ------
        var myArr = [Int]()
        
        DispatchQueue.global().async {
            myArr.append(1)
        }
        DispatchQueue.global().async {
            myArr.append(1)
        }
        DispatchQueue.global().async {
            myArr.append(1)
        }
        DispatchQueue.global().async {
            myArr.append(1)
        }
         DispatchQueue.global().async {
            myArr.append(1)
        }
        // 비동기로 하나의 값을 바라 볼 때 문제가 생길 수 있다 -> 왜냐하면 저것은 비동기이기 때문이지, 스레드가 안전하지 않음
        // 다른 비동기가 값을 변경하고 있는데, 현재 비동기가 값을 건들고 있기 떄문
    }
}
