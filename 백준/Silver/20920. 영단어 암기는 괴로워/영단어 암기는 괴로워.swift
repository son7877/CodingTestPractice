//
//  main.swift
//  BJ20920
//
//  Created by 안홍범 on 3/28/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])
var words = [String]()
for _ in 0..<N {
    words.append(readLine()!)
}

func solution(_ words: [String]) -> [String] {
    // 단어의 등장 빈도를 저장할 딕셔너리
    var wordCount = [String: Int]()
    
    for word in words {
        if word.count >= M { // 길이가 M보다 긴 단어만 취급하므로
            wordCount[word, default: 0] += 1
        }
    }
    
    // 등장 빈도, 길이, 사전순으로 정렬
    let sortedWords = wordCount.keys.sorted {
        if wordCount[$0]! == wordCount[$1]! { // 빈도수
            if $0.count == $1.count { // 단어 길이
                return $0 < $1 // 사전 순
            }
            return $0.count > $1.count
        }
        return wordCount[$0]! > wordCount[$1]!
    }
    
    return sortedWords
}

for word in solution(words) {
    print(word)
}
