//
//  main.swift
//  BJ1904
//
//  Created by 안홍범 on 12/2/24.
//

import Foundation

let N = Int(readLine()!)!

func solution() {
    var dp = [Int](repeating: 0, count: 1000001)
    dp[1] = 1
    dp[2] = 2
    
    if N > 2 {
        for i in 3...N {
            dp[i] = (dp[i-1] + dp[i-2]) % 15746
        }
    }
    
    print(dp[N])
}

solution()
