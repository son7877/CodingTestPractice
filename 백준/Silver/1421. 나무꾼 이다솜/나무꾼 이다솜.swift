//
//  main.swift
//  BJ_1421
//
//  Created by 안홍범 on 3/3/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, C, W) = (input[0], input[1], input[2])
var trees = [Int]()
for _ in 0..<N {
    trees.append(Int(readLine()!)!)
}

func solution(_ trees: [Int], _ C: Int, _ W: Int) -> Int{
    var answer = 0
    
    for length in 1...trees.max()! {
        var total = 0
        
        for tree in trees {
            if tree >= length {
                let cuts = tree / length
                let left = tree % length
                
                let needs = cuts - 1 + (left > 0 ? 1 : 0)
                
                let cost = needs * C
                
                let profit = cuts * length * W - cost
                
                if profit > 0 {
                    total += profit
                }
            }
        }
        answer = max(answer, total)
    }

    return answer
}

print(solution(trees, C, W))
