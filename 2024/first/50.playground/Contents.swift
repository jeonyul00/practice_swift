import UIKit

// Result type

enum MyError:Error {
    case invalidURL
    case timeout
}


var isSuccess = false

func requestNetwork() throws -> String {
    
    if isSuccess {
        return "successString"
    }
    
    throw MyError.invalidURL
    
}

// 다른 방법
do{
    let result = try requestNetwork()
    print(result)
} catch{
    print(error)
}

// result type
func requestNetwork2() -> Result<String, MyError> {
    
    if isSuccess {
        return .success("successString")
    }
    
    return Result.failure(MyError.invalidURL)
    
}

let myResult = requestNetwork2()
switch myResult {
    // let 키워드를 붙여서 : 성공 시 str이라는 이름으로 가져온다.
case let .success(str):
    print(str)
case .failure(let fail):
    print(fail)
}

// 성공했을 때만 str이라는 이름으로 가져와서 로직 실행한다... 아 문법 ㅅㅂ
if case let Result.success(str) = requestNetwork2() {
    print(str)
}
