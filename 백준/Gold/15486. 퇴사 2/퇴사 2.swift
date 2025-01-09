//
//  main.swift
//  BJ15486
//
//  Created by 안홍범 on 1/9/25.
//

import Foundation

let N = Int(readLine()!)!

let arr = (0..<N).map { _ in
    readLine()!
        .split(separator: " ")
        .map {Int($0)!}
}

func solution() {
    var dp = Array(repeating: 0, count: N + 1)
    var result = 0

    for i in 0..<N {
        let (T, P) = (arr[i][0], arr[i][1])

        result = max(result, dp[i])

        if i + T <= N {
            dp[i + T] = max(dp[i + T], result + P)
        }
    }

    print(max(result, dp[N]))
}

solution()
