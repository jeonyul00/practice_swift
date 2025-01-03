import UIKit

// bool
// js는 타입이 겁나 느슨해서 1은 true 0은 false, null은 false 이런 식인데 swift에서는 엄격함
var isTrue: Bool = true
!isTrue  // false
isTrue  // true
// !!isTrue x 엄격하네
!(!isTrue)  // true
isTrue.toggle()
let url: String = "https://test.com"
let isUrl: Bool = url.contains("https://")

if isTrue == true {
    
}

if isTrue {
    
}
