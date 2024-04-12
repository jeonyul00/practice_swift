import UIKit

/*
    에러 처리 (Error handling) 는 프로그램의 에러 조건에서 응답하고 복구하는 프로세스 입니다. Swift는 런타임에 복구 가능한 에러를 던지고 포착하고 전파하고 조작하기 위한 최고 수준의 지원을 제공합니다.
 */

enum err:Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfStock
}

throw err.insufficientFunds(coinsNeeded: 1)
