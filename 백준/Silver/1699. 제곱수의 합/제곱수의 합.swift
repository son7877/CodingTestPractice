//
//  main.swift
//  BJ1699
//
//  Created by 안홍범 on 11/23/24.
//

import Foundation

let N = Int(readLine()!)!

func solution () {
    var dp = [Int](repeating: 0, count: N+1)
    
    for i in 1...N {
        dp[i] = i
        for j in 1...Int(sqrt(Double(i))) {
            dp[i] = min(dp[i], dp[i - j*j] + 1)
        }
    }
    
    print(dp[N])
}

solution()
