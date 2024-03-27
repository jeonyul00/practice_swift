import UIKit

import Foundation

func solution(_ s: String) -> String {
    // 소문자로 변환하고, 알파벳만 남기기
        let chars = Array(s.lowercased())
        var filteredChars = [Character]()
        for char in chars {
            if char.isLetter {
                filteredChars.append(char)
            }
        }
        
        // 팰린드롬 여부 검사
        var leftIndex = 0
        var rightIndex = filteredChars.count - 1
        while leftIndex < rightIndex {
            if filteredChars[leftIndex] != filteredChars[rightIndex] {
                return "NO"
            }
            leftIndex += 1
            rightIndex -= 1
        }
        
        return "YES"}

print(solution("found7, time: study; Yduts; emit, 7Dnuof"))

