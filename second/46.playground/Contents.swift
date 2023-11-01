import UIKit

// 동시성 프로그래밍
// ios15 이전의 기술 : dispatchQueue, completion handler


func someWork() {
    // 5초 정도 소요되는 func
}

func simpleWork() {
    print(1)
}

// 동기적 작업
// someWork() // 5초 걸림
// simpleWork() // 위의 함수가 끝난 후 호출

// -----

// 비동기 함수
func asyncSomeWork() async -> Int {
    try? await Task.sleep(nanoseconds: 1000*1000*1000*5) // 얘를 Task로 감싸면 안되는 이유 -> 이미 얘는 async 내부에 있기 떄문에 브릿지가 필요없음
    print(2)
    return 2
}

func asyncSomeWork2(num: Int) async {
    try? await Task.sleep(nanoseconds: 1000*1000*1000*5)
    print(num + 1)
}

func start() {
    // Task : 동기인 상태에서 비동기를 호출할 때 필요한 브릿지 => 예를 들어 start 함수가 비동기 함수라면 Task가 필요없다.
    Task {
        print(0)
        let value = await asyncSomeWork()
        await asyncSomeWork2(num: value)
        print(4)
    }
    simpleWork()
}


start()
