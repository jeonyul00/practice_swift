import UIKit

// 비동기 함수 병렬 실행 => 이게 뭔 말이야 원래 비동기함수는 병렬로 실행되는거 아닌가

// async let
func asyncWork1(sec:UInt64) async -> Bool {
    do{
        try await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    } catch{
        print(error)
        return false
    }
    print(sec)
    return true
}

// 이러면 Task 안에서는 순서대로 실행이 되지
//Task {
//    await asyncWork1(sec: 3)
//    await asyncWork1(sec: 1)
//    await asyncWork1(sec: 2)
//}

// async let 변수 : 즉시 실행 => 리턴 값이 없어도 변수 써야함
Task {
    async let sec3 = asyncWork1(sec: 3)
    async let sec1 = asyncWork1(sec: 1)
    async let sec2 = asyncWork1(sec: 2)
    
    // promise.All 같은건가
    let result = await [sec3, sec2, sec1]
    if result.contains(false) {
        print("실패")
    }
    print("성공 ", result)
    
    // 만약 sec1만 await라면 => 완료되지 못한 비동기 처리는 캔슬됨 CancellationError (sec2, sec3의 비동기 기능이 취소됨, 동기 기능은 바로 실행됨)
    // await sec1 // 그럼 이게 진짜 겁나 오래걸리는거라서 나머지 작업이 무조건 그 전에 끝나면? 그럼 그냥 잘 되는건데, 너무 위험하지
    print("end")
    
}

