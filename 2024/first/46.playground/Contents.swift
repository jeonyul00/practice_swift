import Foundation
import UIKit

// concurrency progamming(동시성 프로그래밍)
// async / await가 나오기 전(ios 13)까지는 dispatchQueue, completion handler 사용

// 오래걸리는 작업
func someWork() async -> Int {
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * 5) // 왜 얘는 Task 안 묶냐? 이미 비동기 주기 (async) 내에서 호출하기 때문에 Task로 감싸지 않아야함 => 아 self가 비동기 내에 있으면 Task로 감싸야하나보다
    return 10101010101
}

func simpleWork() {
    print("simple fuc")
}


func start() {
    // 비동기는 Task 안에다가 써야함
    Task {
        // 1
        print("start")
        // 3
        let value = await someWork()
        // 3
        print(value)
        // 4
        print("finish")
        // 5
        simpleWork()
    }
    // 2
    simpleWork()
}

start()
