//
//  main.swift
//  BJ17626
//
//  Created by 안홍범 on 9/17/24.
//

import Foundation

let number = Int(readLine()!)!

var dp = Array(repeating: 0, count: number + 1)
dp[0] = 0

for i in 1...number {
    dp[i] = i
    for j in 1...Int(sqrt(Double(i))) {
        dp[i] = min(dp[i], dp[i - j * j] + 1)
    }
}

print(dp[number])
