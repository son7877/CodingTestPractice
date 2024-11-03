//
//  main.swift
//  BJ11055
//
//  Created by 안홍범 on 11/3/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var dp = Array(repeating: 0, count: N)
    var result = 0
    
    for i in 0..<N {
        dp[i] = arr[i]
        for j in 0..<i {
            if arr[i] > arr[j] {
                dp[i] = max(dp[i], dp[j] + arr[i])
            }
        }
        result = max(result, dp[i])
    }
    
    print(result)
}

solution()
