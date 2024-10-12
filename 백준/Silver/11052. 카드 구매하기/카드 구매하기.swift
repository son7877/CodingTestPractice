//
//  main.swift
//  BJ11052
//
//  Created by 안홍범 on 10/12/24.
//

import Foundation

let N = Int(readLine()!)!

let cards = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var dp = [Int](repeating: 0, count: N+1) // dp[i]: i개의 카드를 구매할 때 최대 가격으로 설정
    
    for i in 1...N {
        for j in 1...i {
            dp[i] = max(dp[i], dp[i-j] + cards[j-1])
        }
    }
    
    print(dp[N])
}

solution()
