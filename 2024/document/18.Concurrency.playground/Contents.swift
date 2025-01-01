import UIKit
//
//// 비동기와 병렬은 다르다.
//// Swift 는 구조화된 방식으로 비동기 (asynchronous) 와 병렬 (parallel) 코드 작성을 지원합니다. 비동기 코드 (Asynchronous code) 는 일시적으로 중단되었다가 다시 실행할 수 있지만 한번에 프로그램의 한 부분만 실행됩니다. 프로그램에서 코드를 일시 중단하고 다시 실행하면 UI 업데이트와 같은 짧은 작업을 계속 진행하면서 네트워크를 통해 데이터를 가져오거나 파일을 분석하는 것과 같은 긴 실행 작업을 계속할 수 있습니다. 병렬 코드 (Parallel code) 는 동시에 코드의 여러부분이 실행됨을 의미합니다 —-- 예를 들어 4코어 프로세서의 컴퓨터는 각 코어가 하나의 작업을 수행하므로 코드의 4부분을 동시에 실행할 수 있습니다. 병렬과 비동기 코드를 사용하는 프로그램은 한 번에 여러 작업을 수행하고, 이 코드를 메모리 안전 방식으로 더 쉽게 작성할 수 있도록 합니다.
//
//
//func listPhotos(inGallery name: String) async -> [String] {
//    let photos = try await listPhotos(inGallery: "A Rainy Weekend")
//    return photos
//}
//
///*
// await 를 사용하여 비동기 함수를 호출하면 한번에 코드의 한 부분만 실행됩니다.
// 비동기 코드가 실행되는 동안 호출자는 코드의 다음 라인을 실행하기 위해 이동하기 전에 해당 코드가 완료될 때까지 기다립니다.
// 예를 들어 갤러리에서 처음 세 장의 사진을 가져오려면 다음과 같이 downloadPhoto(named:) 함수에 대한 세 번의 호출을 기다릴 수 있습니다:
// */
//let firstPhoto = await downloadPhoto(named: photoNames[0])
//let secondPhoto = await downloadPhoto(named: photoNames[1])
//let thirdPhoto = await downloadPhoto(named: photoNames[2])
//let photos = [firstPhoto, secondPhoto, thirdPhoto]
//show(photos)
//
///*
// 이 방식에는 중요한 단점이 있습니다: 다운로드가 비동기이고 진행되는 동안 다른 작업을 수행할 수 있지만 downloadPhoto(named:) 에 대한 호출은 한 번에 하나만 실행됩니다.
// 각 사진은 다음 사진이 다운로드를 시작하기 전에 완료됩니다. 그러나 이런 작업을 기다릴 필요가 없습니다 — 각 사진은 개별적으로 또는 동시에 다운로드 할 수 있습니다.
// prmistAll 같군
// */
//async let firstPhoto = downloadPhoto(named: photoNames[0])
//async let secondPhoto = downloadPhoto(named: photoNames[1])
//async let thirdPhoto = downloadPhoto(named: photoNames[2])
//
//let photos = await [firstPhoto, secondPhoto, thirdPhoto]
//show(photos)
//
//// Task

//func hardWork() async {
//    for _ in 0..<9999999 {
//        continue
//    }
//    print("hard work")
//}
//
//func simpleWork() {
//    print("simple work")
//}
//
//
//Task {
//    await hardWork()
//}
//simpleWork()

// async let
func asyncWork(sec:UInt64) async -> UInt64 {
    try? await Task.sleep(nanoseconds: 1000 * 1000 * 1000 * sec)
    return sec
}

Task {
    async let sec3 = asyncWork(sec: 3)
    async let sec1 = asyncWork(sec: 1)
    async let sec2 = asyncWork(sec: 2)
    let promise = await [sec3,sec2,sec1]
    print(promise)
}

#if DEBUG
print("test")
#endif

