import UIKit

var arr = [Int]()

// add
arr.append(1)
arr.append(100)
arr.append(10000)
arr.insert(10, at: 1) // 몇 번 인덱스에 뭘 넣을거냐
arr.insert(1000, at: arr.count - 1) // 몇 번 인덱스에 뭘 넣을거냐
arr.append(contentsOf: [9,99,999,9999]) // concat 같은건가 -> 이건 원본을 제어함

// remove
arr.removeAll()
arr.append(contentsOf: [1,2,3,4,5,6,7,8,9]) // 오 2차원 배열이 아님
let removeElement = arr.remove(at: arr.count - 1) // 해 당 인덱스의 요소를 지우면서 반환
removeElement
arr.removeLast() // 마지막 요소를 제거하며 반환
arr.removeFirst() // 처음 요소를 제거하며 반환
arr
arr.removeFirst(2) // 처음 요소부터 몇 개 지운 후 지운 배열을 반환

// update
arr // 4,5,6,7
arr[0] = 1
arr[1] = 2
arr[2] = 3
arr[3] = 4
arr.append(5)
// arr[4] = 5
// arr[5] = 6

// read
arr.removeAll()
// x : error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x18bd55e10).
// arr[0]
arr.last // nil
arr.first // nil 오 이거로 쓰는게 더 안정적이겠네
