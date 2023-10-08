import UIKit

var greeting = "Hello, playground"

var someValue:Int?

if someValue == nil {
    print("empty")
}

if let someValue {
    print(someValue)
}

someValue = 1

if let someValue {
    print(someValue)
}
