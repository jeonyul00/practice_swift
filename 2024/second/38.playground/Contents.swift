import UIKit

// error handling

enum ErrorType:Int,Error {
    case networkError = 400
    case badRequest = 401
}


func squareArea(width:Int, height:Int) throws -> Int {
    if width < 0 || height < 0 {
        throw ErrorType.badRequest
    }
    return width * height
}


do{
    try squareArea(width: -1, height: 0)
}
catch{
    print(error)
}

// 에러를 받아서 다시 표현
func area(completion:(Int,Int) throws -> Int) rethrows -> Int {
    try completion(-40, 40)
}

do{
    try area(completion: squareArea)
}
catch{
    print(error)
}
