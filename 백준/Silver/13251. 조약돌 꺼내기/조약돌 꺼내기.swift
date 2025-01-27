//
//  main.swift
//  BJ13251
//
//  Created by 안홍범 on 1/26/25.
//

import Foundation

let M = Int(readLine()!)!

let stones = readLine()!
    .split(separator: " ")
    .map{ Int($0)! }

let K = Int(readLine()!)!

func solution() {
    if M == 1 {
        print(1.0)
        return
    }
    
    let sum = stones.reduce(0, +)
    var stonesSum: Double = 1.0

    // 전체 가능한 경우의 수 계산 (조합 계산)
    for i in 0..<K {
        stonesSum *= Double(sum - i)
    }
    
    var total: Double = 0.0

    for stone in stones {
        if stone < K {
            continue
        }
        
        var currentSum: Double = 1.0

        // 특정 색깔을 선택하는 경우의 수 계산 (조합 계산)
        for j in 0..<K {
            currentSum *= Double(stone - j)
        }
        
        total += currentSum
    }
    
    print(total / stonesSum)
}

solution()
