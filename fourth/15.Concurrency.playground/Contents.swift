import UIKit

// Concurrency 동시성 프로그래밍


// 이걸 비동기 함수로 만들어야지
func someWork() async -> Int {
    var total = 0
    (0...999999).forEach { num in total += num}
    print("is some work : ",Date())
    return total
}

func simpleWork(){
    print("is simple work : ", Date())
}

/*
 Swift에서 Task는 비동기 작업을 생성하고 관리하는 데 사용되는 구조체입니다. Task를 사용하면 비동기 함수(async 함수)를 호출하고, 그 결과를 기다리거나 비동기 작업을 백그라운드에서 실행할 수 있습니다. 이를 통해 동시성을 효율적으로 관리할 수 있습니다.
 
 Task의 역할
 Task는 비동기 코드 블록을 감싸고, 이를 실행하여 비동기 작업을 수행합니다. 이는 코루틴을 생성하고 관리하는 역할을 합니다. Task는 메인 스레드를 차단하지 않고 비동기 작업을 수행하므로, UI 응답성을 유지하면서 백그라운드 작업을 처리하는 데 유용합니다.
 */
Task {
    let total = await someWork()
    print(total)
}
simpleWork()
/*
 네, 정확하게 이해하셨습니다. Swift에서 비동기 함수(async 함수)를 호출하고 await 키워드를 사용할 때, 그 함수가 호출되는 부모 환경에 따라 달라집니다. 부모 환경이 동기(synchronous)일 때는 Task를 사용해야 하고, 부모 환경이 비동기(asynchronous)일 때는 그냥 사용할 수 있습니다.
 
 
 
 
 */
