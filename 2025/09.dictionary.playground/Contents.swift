import UIKit

// dictionary -> Key : Value
var name: Dictionary<String,String> = [:]
var name2 = Dictionary<String,String>()
var name3 = [String:String]()

name = ["jeon": "yul"]
name["jeon"] = "YUL"
name.updateValue("Yul", forKey: "jeon")
name

let merging = name.merging(name2) { current, new  in
return current
}

// remove
name["jeon"] = nil
name.removeAll()


