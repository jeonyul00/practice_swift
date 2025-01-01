import UIKit

// result type

enum MyError:Error {
    case invalidURL
    case timeout
}



var isSuccess = false

func requestNetwork() throws ->  String {
    if isSuccess {
        return "successString"
    }
    throw MyError.invalidURL
}

do{
   let result =  try requestNetwork()
}catch{
    print(error)
}

// --

// result type -> 오 이거 편하네
func requestNetwork2() -> Result<String, MyError> {
    if isSuccess {
        return .success("successString")
    }
    return .failure(.invalidURL)
}

let result2 = requestNetwork2()
switch result2 {
case let .success(str):
    print(str)
case let .failure(MyError):
    print(MyError)
}
// case let -> 이게 뭐냐 프롭스 값 가져온다 앞에 써도되고 프롭스명 옆에 써도 됨

// case문 변형 => 모든 케이스말고 하나의 케이스만 가져와서 쓰고 싶을 때
if case let Result.success(str) = requestNetwork2(){
    print(str)
}

if case let .success(str) = requestNetwork2(){
    print(str)
}
