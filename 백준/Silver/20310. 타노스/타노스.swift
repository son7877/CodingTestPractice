//
//  main.swift
//  BJ20310
//
//  Created by 안홍범 on 3/27/25.
//

import Foundation

let input = readLine()!

func solution(_ input: String) -> String {
    var answer = ""
    let totalZeroCount = input.filter { $0 == "0" }.count
    let totalOneCount = input.filter { $0 == "1" }.count
    
    var zeroToRemove = totalZeroCount / 2
    var oneToRemove = totalOneCount / 2
    
    // 1은 앞에서부터 지우고
    // 0은 뒤에서부터 지운다.
    
    var charArr = [Character](input)
    
    for char in input {
        if char == "1" && oneToRemove > 0 {
            oneToRemove -= 1
        } else {
            answer.append(char)
        }
    }
    
    var finalResult = [Character]()
    for char in answer.reversed() {
        if char == "0" && zeroToRemove > 0 {
            zeroToRemove -= 1
        } else {
            finalResult.append(char)
        }
    }
    
    return String(finalResult.reversed())
}

print(solution(input))
