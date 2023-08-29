import UIKit

// dictionary : key value : 순서 x

let names = Dictionary<String, String>()
let names2 = [String : String]()
var names3: [String : String] = [:]
let names4: Dictionary<String, String> = [:]

var names5 = ["cityA" : "Seoul", "CityB" : "LA"]
names5.count
names5.isEmpty // 비어있냐?

names5["cityA"]
// add
names5["cityC"] = "Tokyo"
names5.updateValue("Busan", forKey: "cityD")

// dictionary + dictionary
names3["cityD"] = "Incheon"
names3["cityE"] = "Osaka"
// 뭐를 기준으로 합칠 것인가 => 중복됟 키 값을 어떻게 할 것인가
names3
names5
// current : 앞의 객체(names3), new : 뒤의 객체(names5)
// 클로저 개념
let merginDic = names3.merging(names5) { current, new in
    return current
}
merginDic

// remove
names3["cityD"] = nil
names3
names3.removeValue(forKey: "cityE") // 삭제하는 요소의 값을 반환하면서 삭제
names3.removeAll()

// update
names5
names5["CityB"] = "Hawaii"
names5
