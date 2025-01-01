//
//  ViewController.swift
//  44
//  코드의 시작점
//  Created by 전율 on 2023/09/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SS"
        
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { time in
            let now = Date()
            let dateString = dateFormatter.string(from: now)
            self.timeLabel.text = dateString
        }
        
    }

    // thread : 노예
        // main thread : serial로 작업함, 일반적으로 작성한 코드의 흐름은 main thread가 담당, 일.반.적.으.로, UI 업데이트 및 사용자 인터랙션과 관련된 작업을 담당
    
    
    // !!!!!!!!!!! 이거 중요 js랑 비교해서 생각하지 말자 !!!!!!!!!!!!
    // serial : 하나의 작업이 완료된 후 다음 작업이 진행 : 작업자(쓰레드)가 그 작업이 완료 될 때까지 다른 작업을 못 함
    // concurrent : 한 쓰레드에 여러 작업을 동시에
    // sync : 여러 쓰레드에 여러 작업을 순서대로 , 다른 쓰레드를 멈추게 할 수 있는 개념이 있다
    // async : 여러 쓰레드에 여러 작업을 동시에
    
    @IBAction func start(_ sender: Any) {
        // 연산이 오래 걸리는 작업
        // ( 1초 동안 쓰레드 멈춤이지만 여기선 그냥 오래걸리는 작업으로 생각하자 )
        // main thread로 연산하기 때문에 버튼을 누르는 순간 1초 간 timeLabel이 멈춤
        // Thread.sleep(forTimeInterval: 1)
        // resultLabel.text = "Finish"
        
        // 쓰레드 생성 : DispatchQueue : main을 만들건지 global (다른 쓰레드)로 만들건지 설정 : async하게 작업하게 만들건지 || sync하게 작업하게 만들건지 설정
        //        DispatchQueue.global().async {
        //            // 이 내부의 작업은 serial이지
        //            Thread.sleep(forTimeInterval: 1)
        //            print("thread 1-1")
        //            Thread.sleep(forTimeInterval: 1)
        //            print("thread 1-2")
        //            Thread.sleep(forTimeInterval: 1)
        //            print("thread 1-3")
        //        }
        //
        //        DispatchQueue.global().async {
        //            Thread.sleep(forTimeInterval: 1)
        //            print("thread 2")
        //        }
        //
        //        DispatchQueue.global().async {
        //            Thread.sleep(forTimeInterval: 1)
        //            print("thread 3")
        //        }
        //
        // 만약 DispatchQueue.main()으로 만들면? : main은 1개만 있어야한다. 작성은 되더라도 안 먹힌다.
        //
        // label과 attributes는 필수값
        // label : 쓰레드 이름
        // attributes : 안 쓰면 serial로 작동,
//        let queue = DispatchQueue(label: "myQueue", attributes: .concurrent)
//
//        queue.async {
//            Thread.sleep(forTimeInterval: 1)
//            print("thread 1")
//        }
//        queue.sync {
//            Thread.sleep(forTimeInterval: 1)
//            print("thread 2")
//        }
//        queue.async {
//            Thread.sleep(forTimeInterval: 1)
//            print("thread 3")
//        }
                
        // x : 생명 주기를 잘 생각해보면 왜 안되는지 알겠지?
        //        DispatchQueue.main.sync {
        //            Thread.sleep(forTimeInterval: 1)
        //            print("thread")
        //        }
// o
//        DispatchQueue.global().async {
//            DispatchQueue.main.sync {
//                Thread.sleep(forTimeInterval: 1)
//                print("thread")
//            }
//        }
        
        var arr = [Int]()
        DispatchQueue.global().async {
            arr.append(1)
        }
        DispatchQueue.global().async {
            arr.append(2)
        }
        DispatchQueue.global().async {
            arr.append(3)
        }
        DispatchQueue.global().async {
            arr.append(4)
        }
        DispatchQueue.global().async {
            arr.append(5)
        }
        
        // 시간으로서 딜레이
        // 여기서 연타하면 앱이 터짐 : arr에 append이 완료 되기전에 다음 append가 실행이 되어 한 값에서 충돌이나서 크래시가 터진거지
        // 이러한 점을 숙지하고 async 쓸 것
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            print(arr)
        }
        
    }
}

