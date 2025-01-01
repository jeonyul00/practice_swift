import UIKit

// 비교 연산자 => 이거 js랑 다름

var a = 10
var b = 20
a == b


let aa = [1,2,3]
let bb = [1,2,3]
aa == bb // true : 아니... 참조 타입이 아닌가? => ㅇㅇ swift에서 배열은 값 타입

var cc = aa
cc
cc.append(4)
cc
aa
