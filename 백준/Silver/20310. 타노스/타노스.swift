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
    var stack = [Character]()
    
    for i in input {
        stack.append(i)
    }
    
    stack.sort()
    var count = 1
    
    for i in 0..<stack.count-1 {
        if stack[i] != stack[i+1] {
            break
        }
        count += 1
    }
    
    let oneCount = stack.count - count
    
    let tanosZero = count/2
    let tanosOne = oneCount/2
    
    for _ in 0..<tanosZero {
        answer.append("0")
    }
    
    for _ in 0..<tanosOne {
        answer.append("1")
    }
    
    return answer
}

print(solution(input))
