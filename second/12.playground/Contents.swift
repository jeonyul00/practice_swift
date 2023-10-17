import UIKit

// dictionary : key value, 순서 보장x, 키 중복 불가x

// 생성 empty
let names = Dictionary<String,String>()
let names2 = [String:String]()
var names3:[String:String] = [:]
names.count
names2.isEmpty
names3

// 생성
var names4 = ["cityA":"seouls", "cityB":"la"]
names4.count
names4.isEmpty

// 추가
names4["cityC"] = "tokyo" // value 반환
names4["cityC"]
names4
names4.updateValue("busan", forKey: "cityD") // nil 반환
names4

// dic + dic
names3["cityD"] = "incheon"
names3["cityE"] = "SF"
names3
names4
// cityD가 중복으로 있음 => 클로저에서 0번 인덱스가 names3요소, 1번 인덱스가 namse4요소
let merginDic = names3.merging(names4) { current, new in
    // 키 값 중복 시 살릴 것을 반환
    return current
}
merginDic

// 삭제
names3["cityE"] = nil // nil 반환
names3.removeValue(forKey: "cityD") // 삭제되는 요소 반환
names3.removeAll()

// update
names4["cityB"] = "hawaii"
names4
