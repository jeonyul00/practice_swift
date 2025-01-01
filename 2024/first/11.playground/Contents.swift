import UIKit

// NSCountedSet : 중복된 명령의 카운트 조회 가능
let colors:NSCountedSet = ["Red", "Green", "Blue"]

colors.count(for:"Red") // 1

colors.add("Red")
colors.add("Red")
colors.add("Red")
colors.add("Red")
colors

colors.count(for:"Red") // 5

colors.remove("Red")
colors.count(for:"Red") // 4
colors.remove("Red")
colors.count(for:"Red") // 3
colors.remove("Red")
colors.count(for:"Red") // 2
colors.remove("Red")
colors.count(for:"Red") // 1
