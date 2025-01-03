import UIKit

// tuple -> 길이가 정해진 배열
var myTuple:(Int,String,Bool) = (1,"1",false)
myTuple.0 = 2
myTuple
var myTuple2: (id:Int,name:String,is:Bool) = (id:2, name:"jeonyul", is:true)
var myTuple3: (id:Int,name:String,is:Bool) = (2, "jeonyul", true)
myTuple2.id
myTuple3.is

let (id, name, isTrue) = myTuple3 // 구조분해 할당 같네
