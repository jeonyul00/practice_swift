import UIKit



var myTask: Task<String, Never>?
// async let
func asyncWork1(sec:UInt64) async -> String{
    do{
        try await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    } catch{
        print(error)
    }
    print(sec)
    return String(sec)
}

 myTask = Task {
    async let sec3 =  asyncWork1(sec:3)
    async let sec1 =  asyncWork1(sec:1)
    async let sec2 =  asyncWork1(sec:2)
    await [sec1, sec2, sec3]
    return "finish"
}

// 작업을 중간에 캔슬하고 싶다면? -> Task를 변수로 할당

// 어쩌구 저쩌구 버튼이 눌리면~
myTask?.cancel()

