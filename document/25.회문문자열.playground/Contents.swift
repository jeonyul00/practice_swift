import UIKit

func solution(_ str: String) -> Bool {
    let lowerCasedStr = str.lowercased()
    
    for i in 0..<lowerCasedStr.count {
        let startIndex = lowerCasedStr.index(lowerCasedStr.startIndex, offsetBy: i)
        let endIndex = lowerCasedStr.index(lowerCasedStr.endIndex, offsetBy: -i - 1)
        if lowerCasedStr[startIndex] != lowerCasedStr[endIndex] {
            return false
        }
    }
    return true
}

print(solution("gooG"))
print(solution("goooG"))
