//
//  main.swift
//  BJ9461
//
//  Created by 안홍범 on 9/17/24.
//

import Foundation

let TestCase = Int(readLine()!)!

for _ in 1...TestCase {
    let number = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 101)
    dp[0] = 0
    dp[1] = 1
    dp[2] = 1
    dp[3] = 1
    dp[4] = 2
    dp[5] = 2
    dp[6] = 3
    if number > 6{
        for i in 7...100{
            dp[i] = dp[i-2]+dp[i-3]
        }
    }
    print(dp[number])
}
