//
//  main.swift
//  BJ14651
//
//  Created by 안홍범 on 1/8/25.
//

import Foundation

let N = Int(readLine()!)!

func solution() {
    let mod = 1_000_000_009
    if N == 0 {
        print(1) // N=0인 경우도 dp[0]이 정의됨
        return
    } else if N == 1 {
        print(0) // N=1일 경우 dp[1] 값
        return
    }

    var dp = Array(repeating: 0, count: N + 1)
    dp[0] = 1
    dp[1] = 0
    dp[2] = 2

    if N > 2 {
        for i in 3...N {
            dp[i] = (dp[i - 1] * 3) % mod
        }
    }

    print(dp[N])
}

solution()
