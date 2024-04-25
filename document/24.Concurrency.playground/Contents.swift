import UIKit

/*
 동시성 프로그래밍
 closure
 dispatchQueue
 async/await
 */

func someWork(_ num: Int) async {
    for _ in 0...10000000 { continue }
    // print("someWork" + String(num))
}

func simpleWork(_ num: Int) {
    for _ in 0 ... 10 { continue }
    // print("simpleWork" + String(num))
}

Task {
    await someWork(10)
    simpleWork(2)
}
simpleWork(1)

// ------------------------------------------
// 비동기를 병렬 실행: promiseAll 같은 => async let
func someWork1(_ num: Int) async {
    for _ in 0...10000000 { continue }
    // print("someWork" + String(num))
}

func someWork2(_ num: Int) async {
    for _ in 0...10000000 { continue }
    // print("someWork" + String(num))
}

func someWork3(_ num: Int) async {
    for _ in 0...10000000 { continue }
    // print("someWork" + String(num))
}

Task {
    async let promise1:Void = someWork1(1)
    async let promise2:Void = someWork2(1)
    async let promise3:Void = someWork3(1)
    await promise2 // <--- 이 작업이 완료되면 그냥 바로 다음줄로 감
    let sucess:[Void] = await [ promise1,promise2,promise3 ]
    // 여기까지 왔는데 완료되지 못한 비동기가 있다면? -> 비동기 내용은 cancle, 동기는 그냥 바로 실행
}

// ------------------------------------------

func asyncWork1(_ sec: UInt64) async throws -> UInt64 {
    do {
        try await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * 5)
    } catch{
        print(error)
        throw error
    }
    print(sec)
    return sec
}


var myTask:Task<Void,Error>?

// Task는 참조형
myTask = Task {
    async let sec3 = asyncWork1(3)
    async let sec1 = asyncWork1(1)
    async let sec2 = asyncWork1(2)
    
    let promise = try? await [sec1,sec2,sec3]
    
    print("finish")
}

if let myTask = myTask {
    myTask.cancel() // task cancle, 동기 내용은 바로 실행 비동기는 취소
    myTask.isCancelled // true
    
}
