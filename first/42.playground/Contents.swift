import UIKit

// type castiong : 타입 변환
// type conversion : 타입 변환
// 두 개가 비슷한 뜻이고, 실무에서 크게 분류를 하지 않지만 나는 지금 배우는 중이니 확실히 하고가자 (마치 메소드와 함수처럼)
// 원본자체는 없어지고 새로운 타입으로- : 자바에서도 이랬나? 그랬던거 같기도 하고

// conversion : 원본 데이터가 남아있지 않음, 완전히 재구성
var doubleNum:Double = 5.5
var value = Int(doubleNum) // 5 : 소수점을 제거 (누락)
Double(value) // 5 : 이 전에 이미 누락이 되었었기 때문에 다시 돌아갈 수 없다.

// casting : 원본의 형태를 가지고 있음
class MainClass {
    
}

class Sub1:MainClass {
    var imSub = ""
}

var sub1 = Sub1()
sub1.imSub = "test"

sub1.imSub // test
// type sub1 -> MainClass 업캐스팅
var newMain = sub1 as MainClass

// MainClass -> Sub1 다운 캐스팅
// x : 무조건 된다라는 보장이 없기 때문에 불가
// newMain as Sub1

// 강제 다운 캐스팅
var newSub = newMain as! Sub1
newSub.imSub // test : 이 말은 -> 원본이 그대로 살아있다.

// 되면 바꾸고 아니면 nil
var newSub2 = newMain as? Sub1


// -----
class Media {
    var name = ""
}

class Picture:Media {
    var size = ""
}

class Movie:Media {
    var length = 0
}

var mediaList = [Media]()
let pic1 = Picture()
pic1.size = "400 x 300"
pic1.name = "p1"

let pic2 = Picture()
pic2.size = "100 x 100"
pic2.name = "p2"

let movie1 = Movie()
movie1.length = 180
movie1.name = "m1"

mediaList.append(pic1)
mediaList.append(pic2)
mediaList.append(movie1) // 이게 왜 되냐면 결국 Media를 상속 받았기 때문에 picture와 movie 둘 다 Media 타입으로 묶어서 사용하는 개념 (타입 캐스팅의 개념, 둘 다 무조건 업캐스팅이 가능하기 때문에)

if let pic = mediaList[0] as? Picture {
    print("test pic ", pic.name)
}

// is : 냐?
// mediaList[0]가 Picture타입이냐?
mediaList[0] is Picture

for media in mediaList {
    if let pic = media as? Picture {
        print("test pic ", pic.name)
    } else if let mov = media as? Movie {
        print("test mov ", mov.name)
    }
}
