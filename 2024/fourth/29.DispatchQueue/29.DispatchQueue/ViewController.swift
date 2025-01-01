//
//  ViewController.swift
//  29.DispatchQueue
//
//  Created by 전율 on 8/6/24.
//

import UIKit

class ViewController: UIViewController {
    
    var label:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    let button:UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("button", for: .normal)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let dateFormmater = DateFormatter()
        dateFormmater.dateFormat = "HH:mm:ss.SSS"
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { [weak self] time in
            let now = Date()
            self?.label.text = dateFormmater.string(from: now)
        }
    }
    
    /**
     
     알겠습니다. 좀 더 쉽게 설명해드리겠습니다.

     1. Serial vs. Concurrent
     Serial(직렬)과 Concurrent(병렬)의 차이를 알아봅시다.

     Serial (직렬):

     작업들이 하나씩 차례대로 실행됩니다.
     한 작업이 끝나야 다음 작업이 시작됩니다.
     예: 친구들과 줄을 서서 한 명씩 놀이기구를 타는 것.
     Concurrent (병렬):

     작업들이 동시에 실행될 수 있습니다.
     여러 작업이 한꺼번에 시작됩니다.
     예: 여러 줄에 나누어 동시에 여러 친구들이 놀이기구를 타는 것.
     2. Sync vs. Async
     Sync(동기)와 Async(비동기)의 차이도 살펴봅시다.

     Sync (동기):

     작업이 끝날 때까지 기다렸다가 다음 작업을 시작합니다.
     예: 친구가 놀이기구를 다 탈 때까지 기다린 후 내가 타는 것.
     A -> (A가 끝날 때까지 기다림) -> B
     Async (비동기):

     작업이 끝나지 않아도 다음 작업을 바로 시작합니다.
     예: 친구가 놀이기구를 타는 동안 다른 친구가 옆에서 간식을 사러 가는 것.
     A -> (A가 끝나기를 기다리지 않음) -> B
     조합 이해하기
     이제 Serial/Concurrent와 Sync/Async를 조합한 네 가지 상황을 알아봅시다.

     Serial + Sync:

     한 번에 하나의 작업을 순서대로 하고, 각 작업이 끝날 때까지 기다립니다.
     예: A -> (A 끝나기 기다림) -> B -> (B 끝나기 기다림) -> C
     Serial + Async:

     한 번에 하나의 작업을 순서대로 시작하지만, 각 작업이 끝나기를 기다리지 않습니다.
     예: A (비동기 시작) -> B (비동기 시작) -> C (비동기 시작)
     Concurrent + Sync:

     여러 작업을 동시에 시작하지만, 각 작업이 끝날 때까지 기다립니다.
     예: A (동시 시작, 끝나기 기다림) + B (동시 시작, 끝나기 기다림) + C (동시 시작, 끝나기 기다림)
     Concurrent + Async:

     여러 작업을 동시에 비동기적으로 시작합니다. 각 작업이 끝나기를 기다리지 않습니다.
     예: A (비동기 시작) + B (비동기 시작) + C (비동기 시작)
     */
    
    
    // serial: 하나의 작업이 완료된 후 다음 작업이 진행, thread가 작업이 완료될 때까지 다른 작업은 못함
    // thread1 --- 1 ---
    // thread1          -- 2 --
    // thread1                  ---- 3 ----
    // thread1                              --- 4 ---
    
    // concurrent
    // thread1 --- 1 ---
    // thread1 -- 2 --
    // thread1 ---- 3 ----
    // thread1 --- 4 ---
    
    // sync
    // thread1 --- 1 ---
    // thread2          -- 2 --
    // thread3                  ---- 3 ----
    // thread4                              --- 4 ---
    
    
    // async
    // thread1 --- 1 ---
    // thread2 -- 2 --
    // thread3 ---- 3 ----
    // thread4 --- 4 ---

    
    @objc func buttonTapped() {
        // 오래 걸리는 작업
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 2)
        }
        
        // (0...100000).forEach { print($0) }
        self.button.setTitle("ok\(Int.random(in: 0...100))", for: .normal)
        
        let serialQueue = DispatchQueue(label: "com.example.serialQueue")
        let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

        // Serial + Sync
        serialQueue.sync {
            print("Serial Sync Task 1")
        }
        serialQueue.sync {
            print("Serial Sync Task 2")
        }

        // Serial + Async
        serialQueue.async {
            print("Serial Async Task 1")
        }
        serialQueue.async {
            print("Serial Async Task 2")
        }

        // Concurrent + Sync
        concurrentQueue.sync {
            print("Concurrent Sync Task 1")
        }
        concurrentQueue.sync {
            print("Concurrent Sync Task 2")
        }

        // Concurrent + Async
        concurrentQueue.async {
            print("Concurrent Async Task 1")
        }
        concurrentQueue.async {
            print("Concurrent Async Task 2")
        }

    }
    


}

extension ViewController {
    func setupUI() {
        self.view.addSubview(label)
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
