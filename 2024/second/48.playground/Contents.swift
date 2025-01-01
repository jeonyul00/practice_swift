import UIKit

func asyncWork1(_ sec:UInt64) async -> UInt64 {
    do{
        try await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    } catch{
        print(error)
    }
    print(sec)
    return sec
}


var myTask = Task{
    async let sec5 = asyncWork1(5)
    async let sec1 = asyncWork1(1)
    async let sec3 = asyncWork1(3)
    
    await sec1
    await sec3
    await sec5
    
    // 어떠한 이유로 (코드를 잘못 만들거나) 여기까지왔는데 아직 완료되지 않은 비동기는 캔슬됨, 동기는 실행됨
    print("end")
}

//myTask.cancel() // 태스크 취소 작업을 취소시키고 싶을 때 CancellationError
Task{
    try? await myTask.result.get() // 성공 또는 실패해서 나온 값
}

