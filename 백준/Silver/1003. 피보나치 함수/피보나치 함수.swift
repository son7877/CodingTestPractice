//
//  main.swift
//  BJ1003
//
//  Created by 안홍범 on 9/12/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let num = Int(readLine()!)!
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: num + 1)
    
    dp[0][0] = 1
    if num > 0 {
        dp[1][0] = 0
        dp[1][1] = 1
    }
    
    if num > 1 {
        for i in 2...num {
            dp[i][0] = dp[i-1][0] + dp[i-2][0]
            dp[i][1] = dp[i-1][1] + dp[i-2][1]
        }
    }
    
    print(dp[num][0], dp[num][1])
}
