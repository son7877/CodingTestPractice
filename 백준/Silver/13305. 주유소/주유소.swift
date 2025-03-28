//
//  main.swift
//  BJ13305
//
//  Created by 안홍범 on 3/28/25.
//

import Foundation

let N = Int(readLine()!)!
let roads = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let literPrice = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution(_ roads: [Int], _ literPrice: [Int]) -> Int {
    var answer = 0
    var minPrice = Int.max
    for i in 0..<roads.count {
        minPrice = min(minPrice, literPrice[i])
        answer += minPrice * roads[i]
    }
    
    return answer
}

print(solution(roads, literPrice))
