//
//  main.swift
//  BJ1890
//
//  Created by 안홍범 on 11/3/24.
//

import Foundation

let N = Int(readLine()!)!

let board = (1...N).map { _ in
    readLine()!
        .split(separator: " ")
        .map { Int($0)! }
}

func solution() {
    var dp = Array(
        repeating: Array(repeating: 0, count: N),
        count: N
    ) // dp[i][j]: (i, j) 위치까지 도달하는 경우의 수
    
    dp[0][0] = 1
    
    for i in 0..<N {
        for j in 0..<N {
            if board[i][j] == 0 { continue }
            
            if i + board[i][j] < N { // 오른쪽 이동 범위 체크
                dp[i + board[i][j]][j] += dp[i][j]
            }
            
            if j + board[i][j] < N { // 아래쪽 이동 범위 체크
                dp[i][j + board[i][j]] += dp[i][j]
            }
        }
    }
    
    print(dp[N-1][N-1])
}

solution()
