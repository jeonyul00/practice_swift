import UIKit

// NSCountedSet
// 카운팅을 세거나 기타 등등

let colors: NSCountedSet = ["red", "orange", "blue"]

// 값이 몇 번 추가되었는지 몇 번 카운트 되었는 지 조회가능
colors.count(for: "red") // 1
colors.add("red")
colors // {"red", "orange", "blue"}
colors.count(for: "red") // 2 : 보이는 건 하나지만 중복된 갯 수를 가지고 있다.
colors.remove("red")
colors.count(for: "red") // 1 : 1번 지운거지

// 알고리즘 풀 때 유용하겠다.
