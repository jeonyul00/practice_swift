import UIKit

// async let
func asyncWork1(sec:UInt64) async {
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    print(sec)
}

// 이러면 총 6초가 걸리지
//Task{
//    await asyncWork1(sec:3)
//    await asyncWork1(sec:1)
//    await asyncWork1(sec:2)
//}

// 마치 promiseAll 같은 느낌이군
// 동시에 실행해서 모든 값이 나올 때 까지 기다림
// 결과가 나올 때 까지 3초 걸리겠군
//Task {
//    // 리턴이 없더라도 이대로 써야한다. 스펙임
//    async let sec3 =  asyncWork1(sec:3)
//    async let sec1: () =  asyncWork1(sec:1)
//    async let sec2 =  asyncWork1(sec:2)
//    await [sec3, sec1, sec2]
//}


Task {
    async let sec3 =  asyncWork1(sec:3)
    async let sec1: () =  asyncWork1(sec:1)
    async let sec2 =  asyncWork1(sec:2)
    await sec1
    // 이러면 1초 뒤에 finish가 찍힐텐데 아직 sec2, sec3이 안 끝났잖아 -> sec2, sec3의 로직 내부의 비동기 기능은 cancle이 되고 동기 기능은 바로 호출이됨
    print("finish")
} // Task가 끝날때까지 호출되지 않은 비동기는 취소됨, 동기는 즉시 호출 됨



