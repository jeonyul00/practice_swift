import UIKit

/*
 옵셔널 체이닝 (Optional chaining) 은 현재 nil 일 수 있는 옵셔널 인 프로퍼티, 메서드, 그리고 서브 스크립트를 조회하고 호출하기 위한 프로세스 입니다
 */

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

print(john.residence?.numberOfRooms)
john.residence = Residence()
print(john.residence!.numberOfRooms)

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

