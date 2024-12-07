//
//  main.swift
//  BJ2502
//
//  Created by 안홍범 on 12/7/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map({Int($0)!})

let (D, K) = (input[0], input[1])

func solution() {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: D+1)
    
    dp[1][0] = 1
    dp[2][1] = 1
    
    for i in 3...D {
        dp[i][0] = dp[i-1][0] + dp[i-2][0]
        dp[i][1] = dp[i-1][1] + dp[i-2][1]
    }
    
    var A = 1
    var B = 1
    
    while true {
        if (K - A * dp[D][0]) % dp[D][1] == 0 {
            B = (K - A * dp[D][0]) / dp[D][1]
            break
        }
        A += 1
    }
    
    print(A)
    print(B)
}

solution()
