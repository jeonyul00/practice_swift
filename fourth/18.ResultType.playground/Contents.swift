import UIKit

// Result Type
enum MyError:Error {
    case invalidURL
    case timeout
}

var isSuccess = false

func requestNetwork() throws -> String {
    if isSuccess {
        return "success"
    } else {
        throw MyError.invalidURL
    }
}

do {
    let result = try requestNetwork()
} catch {
    print(error)
}


func requestNetwork2() -> Result<String, MyError> {
    if isSuccess {
        return .success("success")
    } else {
        return .failure(.invalidURL)
    }
}

let myResult = requestNetwork2()

switch myResult {
case .success(let str):
    print(str)
case .failure(let error):
    print(error)
}

// success만 받겠다.
if case let Result.success(str) = requestNetwork2() {
    print(str)
}
