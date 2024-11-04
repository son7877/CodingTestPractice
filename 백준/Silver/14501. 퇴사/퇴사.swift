//
//  main.swift
//  BJ14501
//
//  Created by 안홍범 on 11/4/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = (1...N).map { _ in
    readLine()!
        .split(separator: " ")
        .map { Int($0)! }
}

let T = arr.map { $0[0] }
let P = arr.map { $0[1] }

func solution() {
    var dp = Array(repeating: 0, count: N+1)
    
    for i in 0..<N {
        dp[i+1] = max(dp[i+1], dp[i])
        
        if i + T[i] <= N {
            dp[i+T[i]] = max(dp[i+T[i]], dp[i] + P[i])
        }
    }
    
    print(dp[N])
}

solution()
