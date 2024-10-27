//
//  main.swift
//  BJ1309
//
//  Created by 안홍범 on 10/27/24.
//

import Foundation

let input = Int(readLine()!)!

func solution() {
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: input+1) // dp[i][j] : i번째 우리에 사자를 배치하는 경우의 수, j: 0(사자가 없는 경우), 1(왼쪽에 사자가 있는 경우), 2(오른쪽에 사자가 있는 경우)
    
    dp[1][0] = 1
    dp[1][1] = 1
    dp[1][2] = 1
    
    if input == 1 {
        print(dp[1].reduce(0, +) % 9901)
        return
    }
    
    for i in 2...input {
        dp[i][0] = (dp[i-1][0] + dp[i-1][1] + dp[i-1][2]) % 9901 // 사자가 없는 경우
        dp[i][1] = (dp[i-1][0] + dp[i-1][2]) % 9901 // 왼쪽에 사자가 있는 경우
        dp[i][2] = (dp[i-1][0] + dp[i-1][1]) % 9901 // 오른쪽에 사자가 있는 경우
    }
    
    print((dp[input][0] + dp[input][1] + dp[input][2]) % 9901)
}

solution()
