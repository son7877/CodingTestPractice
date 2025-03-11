//
//  main.swift
//  BJ_15989
//
//  Created by 안홍범 on 3/11/25.
//

import Foundation

let testCase = Int(readLine()!)!
for _ in 0..<testCase {
    let N = Int(readLine()!)!
    print(solution(N))
}

func solution(_ N: Int) -> Int {
    var answer = 0
    var dp = Array(
        repeating: Array(repeating: 0, count: 3),
        count: 10001
    )
    
    dp[1][0] = 1
    
    dp[2][0] = 1
    dp[2][1] = 1
    
    dp[3][0] = 1
    dp[3][1] = 1
    dp[3][2] = 1
    
    for i in stride(from: 4, through: 10000, by: 1) {
        dp[i][0] = dp[i - 1][0]
        dp[i][1] = dp[i - 2][0] + dp[i - 2][1]
        dp[i][2] = dp[i - 3][0] + dp[i - 3][1] + dp[i - 3][2]
    }
    
    answer = dp[N].reduce(0, +)
    
    return answer
}
