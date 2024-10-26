//
//  main.swift
//  BJ11057
//
//  Created by 안홍범 on 10/26/24.
//

import Foundation

let N = Int(readLine()!)!

func solution() {
    var dp = Array(
        repeating: Array(repeating: 0, count: 10),
        count: N+1
    ) // dp[i][j] : i자리수의 수 중 j로 끝나는 수의 개수
    
    if N == 1 {
        print(10)
        return
    }
    
    for i in 0...9 {
        dp[1][i] = 1
    }
    
    for i in 2...N { // i자리수
        for j in 0...9 { // j로 끝나는
            for k in 0...j { // k이하의 수
                dp[i][j] += dp[i-1][k]
                dp[i][j] %= 10007
            }
        }
    }
    
    print(dp[N].reduce(0, +) % 10007)
}

solution()
