//
//  main.swift
//  BJ2294
//
//  Created by 안홍범 on 10/13/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (n,k) = (input[0], input[1])

var coins = [Int]()

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

func solution() {
    var dp = [Int](repeating: 0, count: k+1) // dp[i] = i원을 만들 수 있는 최소 동전 개수
    
    for i in 1...k {
        dp[i] = 10001 // 1<= k <= 10000 즉, 불가능한 경우를 위한 초기값 설정
        
        for coin in coins {
            if i - coin < 0 {
                continue
            }
            dp[i] = min(dp[i], dp[i-coin] + 1)
        }
    }
    
    if dp[k] == 10001 {
        print(-1)
    } else {
        print(dp[k])
    }
}

solution()
