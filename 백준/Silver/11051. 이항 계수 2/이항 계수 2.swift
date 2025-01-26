//
//  main.swift
//  BJ11051
//
//  Created by 안홍범 on 1/26/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, K) = (input[0], input[1])

func solution() {
    var dp = Array(
        repeating:
            Array(repeating: 0, count: 1001),
        count: 1001
    )
    
    for i in 0...1000 {
        dp[i][0] = 1
        dp[i][i] = 1
    }
    
    for i in 2...1000 {
        for j in 1..<i {
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j]) % 10007
        }
    }
    
    print(dp[N][K])
}

solution()
