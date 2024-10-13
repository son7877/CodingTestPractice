//
//  main.swift
//  BJ2293
//
//  Created by 안홍범 on 10/13/24.
//
// 1차 제출: 런타임 에러
// 조건: 경우의 수는 2^31 - 1 이하

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
    var dp = [Int](repeating: 0, count: k+1) // dp[i] i원을 만들 수 있는 경우의 수
    
    dp[0] = 1
    
    for coin in coins {
        for i in 1...k {
            if i - coin < 0 { // 조합이 불가능한 경우를 걸러내기 위함
                continue
            }
            if dp[i] + dp[i-coin] > Int(pow(2.0, 31.0)) {
                dp[i] = 0
            } else{
                dp[i] += dp[i-coin]
            }
        }
    }
    
    print(dp[k])
}

solution()
