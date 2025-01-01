import UIKit

/*
 동시성 프로그래밍
 async / await -> ios13 이상에서 만들기 가능, 제공해주는 것은 ios15 이상부터 가능
 동시성 프로그래밍은 기존에는 dispatchQueue, closure를 사용해서 할 수 있었다.
 */

func someWork() {
    // 5초 정도 소요되는 로직
    // Task.sleep(nanoseconds: 1000 * 1000 * 1000 * 5)
}

func simpleWork() {
    print("0.1초 걸리는 간단한 로직")
}


// 동기적으로 호출 -> 5.1초 걸림
//someWork()
//simpleWork()


func someAsyncFunc() async {
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * 5)
    print("someAsyncFunc 끝!")
}


// Task: 동기와 비동기를 연결해줌
// Task: 동기인 배경에서 비동기를 호출 할 때 쓰는거임

// 여기는 비동기 Task와 simpleWork()를 바로바로 호출
Task {
    // 여기는 부분은 동기
    await someAsyncFunc()
    print("await가 끝날 때 까지 여기는 호출되지 않음, 얘는 5초 뒤에 나오겠지, 5.1초 아니지")
}
// 애는 바로 나오겠지
simpleWork()
