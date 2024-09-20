//
//  main.swift
//  BJ11727
//
//  Created by 안홍범 on 9/19/24.
//
// 2xn 타일링 2
// 1차 생각 : 동적계획법으로 풀어보자
// n = 1 -> 1
// n = 2 -> 3
// n = 3 -> 5
// n = 4 -> 11
// n = 5 -> 21


import Foundation

let size = Int(readLine()!)!

var dp = Array(repeating: 0, count: size + 1)

for i in 1...size {
    if i == 1 {
        dp[i] = 1
    } else if i == 2 {
        dp[i] = 3
    } else {
        dp[i] = (dp[i - 1] + 2 * dp[i - 2]) % 10007
    }
}

print(dp[size])