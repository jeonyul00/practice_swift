import UIKit

// 동시성 프로그래밍3
func asyncWork1(sec:UInt64) async throws -> UInt64 {
    do {
        try await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    } catch {
        print(error)
        throw error
    }
    print(sec)
    return sec
}

// Task<String, Never> : 반환형, 에러형 (나오는게 없다하면 Never)
var myTask:Task<Void, Error>? = Task {
    async let sec1 = asyncWork1(sec:1)
    async let sec2 = asyncWork1(sec:3)
    async let sec3 = asyncWork1(sec:5)
    
    let sum = try await (sec1+sec2+sec3)
    
    // 취소되는 상황 체크
    // 취소 시 true, 작동 시 false
    guard myTask?.isCancelled == false else {
        return
    }
    
    print("sum ::: ",sum)
}
// task 결과

Task {
    await myTask?.result // success() : ()안에는 반환되는 값 : 없으면 ()
    let a = try await myTask?.value
    print(a)
    
    
    do {
        let taskValue = try await myTask?.result.get()
        
        print(taskValue)
    } catch{
        print(error)
    }
    
}


//  task 취소
// myTask.cancel()
func pressCancelButton() {
    myTask?.cancel()
}

