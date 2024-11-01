//
//  main.swift
//  BJ2225
//
//  Created by 안홍범 on 11/1/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, K) = (input[0], input[1])

func solution() {
    var dp = Array(
        repeating: Array(repeating: 0, count: N+1),
        count: K+1
    ) // dp[k][n] : k개로 n을 만드는 경우의 수
    
    for n in 0...N { // 1개로 n를 만드는 경우의 수 -> n자신이므로 1개
        dp[1][n] = 1
    }
    
    for k in 1...K {
        dp[k][0] = 1
        for n in 1...N {
            dp[k][n] = (dp[k-1][n] + dp[k][n-1]) % 1000000000
        }
    }
    
    print(dp[K][N])
}

solution()
