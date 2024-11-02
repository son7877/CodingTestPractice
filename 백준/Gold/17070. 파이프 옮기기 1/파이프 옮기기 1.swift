//
//  main.swift
//  BJ17070
//
//  Created by 안홍범 on 11/2/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = (1...N).map { _ in
    readLine()!
        .split(separator: " ")
        .map { Int($0)! }
}

func solution() {
    // dp[i][j][k]: (i, j) 위치에 k 상태(0: 가로, 1: 세로, 2: 대각선)로 도달하는 경우의 수
    var dp = Array(
        repeating: Array(repeating: Array(repeating: 0, count: 3), count: N),
        count: N
    )
    
    // 초기값 설정: 첫 번째 행의 두 번째 열에 가로 상태에서 시작
    dp[0][1][0] = 1
    
    for i in 0..<N {
        for j in 0..<N {
            if arr[i][j] == 1 { continue } // 벽이면 넘어감
            
            // 가로 상태 처리
            if j + 1 < N && arr[i][j+1] == 0 {
                dp[i][j+1][0] += dp[i][j][0] + dp[i][j][2]
            }
            
            // 세로 상태 처리
            if i + 1 < N && arr[i+1][j] == 0 {
                dp[i+1][j][1] += dp[i][j][1] + dp[i][j][2]
            }
            
            // 대각선 상태 처리 (가로, 세로, 대각선 모두 가능)
            if i + 1 < N && j + 1 < N && arr[i+1][j+1] == 0 && arr[i+1][j] == 0 && arr[i][j+1] == 0 {
                dp[i+1][j+1][2] += dp[i][j][0] + dp[i][j][1] + dp[i][j][2]
            }
        }
    }

    // 위 3가지 경우 모두 합산
    let result = dp[N-1][N-1].reduce(0, +)
    
    print(result)
}

solution()
