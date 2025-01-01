import UIKit

// Concurrency 비동기 병렬 처리

Task {
    
}

func asyncWork(sec:UInt64) async -> UInt64 {
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    print(sec)
    return sec
}

func voidAsyncWork(sec:UInt64) async {
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    print(sec)
}

Task {
//    async let sec3 = asyncWork(sec: 3)
//    async let sec1 = asyncWork(sec: 1)
//    async let sec2 = asyncWork(sec: 2)
//    
//    let secArray = await [sec3, sec1, sec2]
//    print(secArray)
        
    async let _ = voidAsyncWork(sec: 3)
    async let _ = voidAsyncWork(sec: 1)
    async let _ = voidAsyncWork(sec: 2)
    
}


