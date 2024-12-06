//
//  main.swift
//  BJ2193
//
//  Created by 안홍범 on 12/6/24.
//

import Foundation

let N = Int(readLine()!)!

func solution() {
    var dp = [Int](repeating: 0, count: 91)
    
    dp[0] = 0
    dp[1] = 1
    dp[2] = 1
    
    if N > 2 {
        for i in 3...N {
            dp[i] = dp[i-1] + dp[i-2]
        }
    }
    
    print(dp[N])
}

solution()
