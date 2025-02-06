//
//  main.swift
//  BJ2467
//
//  Created by 안홍범 on 2/6/25.
//

import Foundation

let N = Int(readLine()!)!

let solutions = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    // 특성 값이 0에 가까운 두 용액 고르기
    // 투 포인터로 탐색
    
    var left = 0
    var right = N-1
    var minSum = Int.max // 두 용액의 합
    var result = (0, 0)

    while left < right {
        let sum = solutions[left] + solutions[right]

        if abs(sum) < minSum {
            minSum = abs(sum)
            result = (solutions[left], solutions[right])
        }

        if sum < 0 {
            left += 1
        } else {
            right -= 1
        }
    }

    print("\(result.0) \(result.1)")
}

solution()
