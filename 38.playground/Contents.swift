import UIKit

// Error handling

// error type
enum MyError: Error {
    case invalidValue
    case outOfLimit
}

var number = 0

// throws : 에러가 생길 수 있는 함수 throw쓰려면 throws 명시
func squareArea(width:Int,height:Int) throws -> Int {
    if width <= 0 || height <= 0 {
        throw MyError.invalidValue
    }
    return width * height
}

// throws 함수 사용 시 try 명시 : 뭐 이 따위로 쓰냐 => do try catch : do랑 chtch가 한 쌍이고 do 안에서 try, catch의 error은 예약어, 오 프롭스로 안 던져도 되는건가
do {
    try squareArea(width: 0, height: 10)
} catch {
    print(error)
}

// error 시 nil
try? squareArea(width: 0, height: 10)
// error 뒤져도 안나옴 강제 실행 => 잘 안쓸 듯 => 이 상황에 에러가 나오면 앱 크래시
try! squareArea(width: 0, height: 10)

// throws 함수를 받아서 받아서 새로운 함수에서 쓰려면? rethrows : callback 쪽에서 발생한 error을 다시 전달하는 것 뿐
func reAreaFunc(callback: (Int,Int) throws -> Int) rethrows -> Int {
    try callback(0,0)
}

do{
    try reAreaFunc(callback: squareArea)
}catch{
    print(error)
}
