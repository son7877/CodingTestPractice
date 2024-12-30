//
//  main.swift
//  BJ14613
//
//  Created by 안홍범 on 12/30/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Double($0)!}

// 이길 확률, 질 확률, 비길 확률
let (win, lose, draw) = (input[0], input[1], input[2])

func solution() {
    // 20게임 진행 후 각 티어에 도달할 확률 출력
    // 2000점에서 시작, 이기면 50점 상승, 지면 50점 하락, 비기면 변동 없음
    /*
        브론즈 : 1000 ~ 1499
        실버 : 1500 ~ 1999
        골드 : 2000 ~ 2499
        플래티넘 : 2500 ~ 2999
        다이아몬드 : 3000 ~ 3499
     */
    
    // dp[i][j] : i번째 게임에서 현재 점수가 j일 확률
    var dp = Array(repeating: Array(repeating: 0.0, count: 3001), count: 21)
    dp[0][2000] = 1.0
    
    for i in 0..<20 { // 20게임 진행
        for j in 1000...3000 {
            if dp[i][j] > 0.0 { // 현재 확률이 0이 아닐 경우만 진행
                // 이기는 경우
                dp[i + 1][min(3000, j + 50)] += dp[i][j] * win
                // 지는 경우
                dp[i + 1][max(1000, j - 50)] += dp[i][j] * lose
                // 비기는 경우
                dp[i + 1][j] += dp[i][j] * draw
            }
        }
    }
    
    // 티어별 확률 출력
    var result = [Double](repeating: 0.0, count: 5)
    for i in 1000...3000 {
        switch i {
        case 1000..<1500:
            result[0] += dp[20][i]
        case 1500..<2000:
            result[1] += dp[20][i]
        case 2000..<2500:
            result[2] += dp[20][i]
        case 2500..<3000:
            result[3] += dp[20][i]
        default:
            result[4] += dp[20][i]
        }
    }
    
    for i in 0..<5 {
        print(String(format: "%.8f", result[i]))
    }
}

solution()
