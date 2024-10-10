//
//  main.swift
//  BJ2156
//
//  Created by 안홍범 on 10/10/24.
//

import Foundation

let number = Int(readLine()!)!

let juice = (0..<number).map{ _ in
    Int(readLine()!)!
}

// 잔을 선택 -> 그 잔을 비움 -> 원래 위치에 놓기
// 연속으로 3잔은 선택 불가
// 최대로 마실 수 있는 포도주의 양 -> DP

func solution() {
    var dp = Array(repeating: 0, count: number)
    
    dp[0] = juice[0]
    if number > 1 {
        dp[1] = juice[0] + juice[1]
    }
    if number > 2 {
        dp[2] = max(dp[0] + juice[2],
                    juice[1] + juice[2],
                    dp[1])
    }
    if number > 3 {
        for i in 3..<number {
            dp[i] = max(dp[i-2] + juice[i],
                        dp[i-3] + juice[i-1] + juice[i],
                        dp[i-1])
        }
    }
    
    print(dp[number-1])
}

solution()
