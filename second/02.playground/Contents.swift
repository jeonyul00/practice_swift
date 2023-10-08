import UIKit


/*
    collection
    arr, set, dic, tuple
 */
var arr:[Int] = [0,1,2,3,4,5,6,7,8,9,10]
arr.forEach { num in
    if num % 2 == 0 {
        print("num ::: \(num)")
    }
}
for num in arr  where num % 2 == 0 {
    print("num ::: \(num)")
}

var numbers:Array<Int> = [1,2,3,4,5,6]
numbers.count
var numbers2:Array<Int> = Array<Int>(1...10)
numbers2

