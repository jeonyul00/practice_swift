//
//  ViewController.swift
//  23.DispatchQueue
//
//  Created by 전율 on 2024/04/12.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.S"
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { Timer in
            let now = Date()
            self.timeLabel.text = dateFormatter.string(from: now)
        }
    }
    
    // 스펙
    // main thread: serial로만 작업 가능, ui update는 무적권 main thread에서만 가능
            
    // serial
    // thread1 --- 1 ---
    // thread1          --- 2 ---
    // thread1                   --- 3 ---
    
    // concurrent
    // thread1 --- 1 ---
    // thread1 --- 2 ---
    // thread1 --- 3 ---
        
    // sync
    // thread1 --- 1 ---
    // thread2          --- 2 ---
    // thread3                   --- 3 ---
    
    // async
    // thread1 --- 1 ---
    // thread2 --- 2 ---
    // thread3 --- 3 ---
    
    @IBAction func start(_ sender: Any) {
        
        
//        let queue = DispatchQueue(label: "myQueue", attributes: .concurrent)
        let queue = DispatchQueue(label: "myQueue")
        
        queue.async {
            for _ in 0 ... 9999999 { continue }
            print("finish1")
        }
        
        queue.async {
            for _ in 0 ... 9999999 { continue }
            print("finish2")
        }
        
        queue.async {
            for _ in 0 ... 9999999 { continue }
            print("finish3")
        }
        
        
    }
    
}
/*
 Serial vs Concurrent:

 Serial Queue (직렬 큐): 이 큐에 추가된 작업들은 한 번에 하나씩 순차적으로 실행됩니다. 즉, 하나의 작업이 완료된 후 다음 작업이 시작됩니다. 이는 작업들이 실행 순서를 보장하지만, 여러 코어를 활용하는 병렬 처리는 하지 않습니다.
 Concurrent Queue (병렬 큐): 이 큐에 추가된 작업들은 동시에 실행될 수 있습니다. 따라서 작업들이 시작된 순서와 끝나는 순서가 다를 수 있으며, 시스템은 여러 작업을 여러 코어에 분산시켜 더 빨리 처리할 수 있습니다.
 Sync vs Async:

 Sync (동기): 동기 작업을 큐에 추가하면, 해당 작업이 완료될 때까지 코드의 실행이 멈춥니다. 즉, 큐에 작업을 추가하고, 그 작업이 완료될 때까지 다음 코드 줄로 넘어가지 않습니다. 이는 작업의 완료를 기다리며, 때로는 이로 인해 UI가 멈추는 등의 차단(blocking) 현상이 발생할 수 있습니다.
 Async (비동기): 비동기 작업을 큐에 추가하면, 작업이 바로 시작될 수도 있고 나중에 시작될 수도 있지만, 작업의 완료를 기다리지 않고 즉시 다음 코드 줄로 넘어갑니다. 이는 작업이 백그라운드에서 처리되며, 주 스레드(예를 들어 UI 스레드)가 차단되지 않도록 합니다.
 예시:

 Serial + Sync: 모든 작업이 순차적으로 완료될 때까지 기다립니다. 다음 작업은 이전 작업이 완전히 끝난 후에만 시작됩니다.
 Serial + Async: 작업은 순차적으로 시작되지만, 각 작업의 완료를 기다리지 않습니다. 하나의 작업이 끝나야 다음 작업이 시작되지만, 메인 코드의 실행은 차단되지 않습니다.
 Concurrent + Sync: 여러 작업이 동시에 시작될 수 있지만, 각 작업의 완료를 기다립니다. 이 경우에도 차단 현상이 발생할 수 있습니다.
 Concurrent + Async: 여러 작업이 동시에 시작되며, 그 완료를 기다리지 않습니다. 이는 가장 비차단적인 방식으로, 작업들이 동시에 실행되면서도 코드의 나머지 부분이 계속 진행될 수 있도록 합니다.
 */
