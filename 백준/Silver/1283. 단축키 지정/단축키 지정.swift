//
//  main.swift
//  BJ1283
//
//  Created by 안홍범 on 11/11/24.
//

import Foundation

let N = Int(readLine()!)!
// 단어는 한 줄에 2개 이상일 수 있음
let words = (1...N).map{_ in
    readLine()!
        .split(separator: " ")
}

func solution() {
    var keywords = Set<Character>()  // 사용된 단축키를 저장하는 Set
    
    for option in words {
        var optionWords = option  // 현재 옵션의 단어들
        var assigned = false  // 단축키가 할당되었는지 여부
        
        // 1단계: 각 단어의 첫 글자를 확인하여 단축키 할당
        for i in 0..<optionWords.count {
            let firstChar = optionWords[i].first!.lowercased()
            if !keywords.contains(Character(firstChar)) {
                keywords.insert(Character(firstChar))
                optionWords[i] = "[" + optionWords[i].prefix(1) + "]" + optionWords[i].dropFirst()
                assigned = true
                break
            }
        }
        
        // 2단계: 첫 글자에서 할당되지 않았다면 각 단어의 나머지 문자에서 찾기
        if !assigned {
            outerLoop: for i in 0..<optionWords.count {
                for (j, char) in optionWords[i].enumerated() {
                    let lowerChar = char.lowercased()
                    if !keywords.contains(Character(lowerChar)) {
                        keywords.insert(Character(lowerChar))
                        
                        // 현재 단어에서 해당 문자를 [ ]로 감싸기
                        var word = String(optionWords[i])
                        let startIndex = word.index(word.startIndex, offsetBy: j)
                        let endIndex = word.index(after: startIndex)
                        word.replaceSubrange(startIndex..<endIndex, with: "[\(char)]")
                        optionWords[i] = Substring(word)
                        
                        break outerLoop
                    }
                }
            }
        }
        
        // 결과 출력
        print(optionWords.joined(separator: " "))
    }
}

solution()
