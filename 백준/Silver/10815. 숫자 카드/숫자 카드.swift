//
//  main.swift
//  BJ_10815
//
//  Created by 안홍범 on 2/27/25.
//

import Foundation

let N = Int(readLine()!)!
var cards = Set(readLine()!
    .split(separator: " ")
    .map{Int($0)!})
let M = Int(readLine()!)!
let numbers = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution(_ N: Int, _ M: Int , _ cards: Set<Int>, _ numbers: [Int]) -> [Int] {
    var answer = [Int]()
    
    for i in 0..<numbers.count {
        if cards.contains(numbers[i]){
            answer.append(1)
        } else {
            answer.append(0)
        }
    }
    
    return answer
}

print(solution(N,M,cards,numbers).map{String($0)}.joined(separator: " "))
