import UIKit

// tuple ()
var tupleEx:(Int, String, Bool) = (1,"2", false)
tupleEx
tupleEx.2 // 이 방법은 별로

var someTuple2 = (strValue : "1",numberValue : 1)
var someTuple3:(strValue: String, numberValue: Int) = (strValue : "1",numberValue : 1)
someTuple2.numberValue
someTuple3.numberValue

// 비구조화 할당이랑 같은 개념 : tuple만 되나?
let (numberValue, stringValue, booleanValue) = tupleEx
numberValue

// x : Expected pattern : arr는 안되나보다.
//let testArr:Array<Any> = [1, "2", false]
//let [numberValueArr, stringValueArr, booleanValueArr] = testArr

// update
someTuple2.numberValue = 100
someTuple2

// 삭제나 추가는 할 수 없지 왜냐하면 tuple이니까
