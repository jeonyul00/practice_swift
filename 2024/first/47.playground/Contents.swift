import UIKit
import Foundation

// 동시성 프로그래밍2

// parallel : 비동기 함수를 병렬 실행
// 1. 노가다
Task{
    // 비동기 함수1
}
Task{
    // 비동기 함수2
}
Task{
    // 비동기 함수3
}

// 2. async let
func asyncWork1(sec:UInt64) async -> UInt64 {
    do{
        try await Task.sleep(nanoseconds: 1000*1000*1000*sec)
    }
    catch{
        print(error)
    }
    print(sec)
    return sec
}

//
Task { // 아 Task가 약간 동기와 비동기의 브릿지 역할이네
    //    이러면 순서대로 나오지
    //    await asyncWork1(sec:3)
    //    await asyncWork1(sec:1)
    //    await asyncWork1(sec:2)

    // 이러면 병렬처리
    async let sec3 = asyncWork1(sec:3)
    async let sec1 = asyncWork1(sec:1)
    async let sec2 = asyncWork1(sec:2)
    // 만약 리턴이 없는 함수를 병렬처리 하려면? -> 그래도 위의 함수처럼 해야함ㅇㅇ 규격임
    // await [sec3, sec2, sec1] // 반환형이 없으면 이렇게
    let secArr = await [sec3, sec2, sec1] // promise.all 같네
    print(secArr)
}

//
Task {
    // 이러면? => 1, finish, (곧바로)2, (곧바로)3
    // finish 이후 테스크 끝 -> 남은 비동기는? (sec2,sec3) -> 내부로직 await Task.sleep(nanoseconds: 1000*1000*1000*sec)가 취소됨 (비동기 부분이 취소됨, 동기부분은 살아있음)
    // 뭐 이따위로 만들었냐
    async let sec3 = asyncWork1(sec:3) // CancellationError()
    async let sec1 = asyncWork1(sec:1)
    async let sec2 = asyncWork1(sec:2) // CancellationError()
    await sec1
    print("finish")
}

