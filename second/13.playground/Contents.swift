import UIKit

// tuple
// 구조가 고정 -> 제거,추가 안됨

var someTuple1 = ( 1,"str", true )
var someTuple2:(Int,String,Bool)=( 1,"str", true )
someTuple1 == someTuple2 // swift에서는 이게 true가 나오네.

// 조회
someTuple1.0
someTuple1.self

// 키를 만들어서 생성
var someTuple3 = (number: 1,name: "str", isTrue: true )
someTuple3.number
someTuple3.isTrue

// 가져올 때 키 값 정하기
var (number, name, isTrue) = someTuple1
number = 2
someTuple1.0 // 1 : 걍 새로운 변수를 만든거임, someTuple1랑 관계없음

// update
someTuple2.0 = 100
someTuple2
