//
//  main.swift
//  BJ12865
//
//  Created by 안홍범 on 10/10/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N,K) = (input[0],input[1])

let lugguages = (0..<N).map{ _ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    var dp = Array(repeating: Array(repeating: 0, count: K+1), count: N+1) // dp[i][j]: i번째 물건까지 넣었을 때 무게 j일 때 최대 가치
    
    for i in 1...N {
        let (w,v) = (lugguages[i-1][0], lugguages[i-1][1])
        
        for j in 1...K {
            if j < w { // 물건의 무게가 가방의 무게보다 크면 이전 값을 가져옴
                dp[i][j] = dp[i-1][j]
            } else { // 물건의 무게가 가방의 무게보다 작거나 같으면 이전 값과 이전 물건의 가치 + 현재 물건의 가치 중 큰 값을 가져옴
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-w] + v)
            }
        }
    }
    
    print(dp[N][K])
}

solution()
