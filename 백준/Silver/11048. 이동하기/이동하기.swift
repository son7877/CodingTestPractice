//
//  main.swift
//  BJ11048
//
//  Created by 안홍범 on 12/1/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])

let maze = (0..<N).map { _ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    var dp = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

    dp[0][0] = maze[0][0]

    for i in 1..<N {
        dp[i][0] = dp[i-1][0] + maze[i][0]
    }

    for j in 1..<M {
        dp[0][j] = dp[0][j-1] + maze[0][j]
    }

    for i in 1..<N {
        for j in 1..<M {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + maze[i][j]
        }
    }

    print(dp[N-1][M-1])
}

solution()
