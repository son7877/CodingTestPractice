//
//  main.swift
//  BJ12852
//
//  Created by 안홍범 on 10/6/24.
//

import Foundation

var number = Int(readLine()!)!

func solution( _ number: Int) {
    var dp = Array(repeating: 0, count: number+1)
    var before = Array(repeating: 0, count: number+1)
    
    for i in 2...number {
        dp[i] = dp[i-1] + 1
        before[i] = i - 1
        
        if i % 2 == 0 && dp[i] > dp[i/2] + 1 {
            dp[i] = dp[i/2] + 1
            before[i] = i/2
        }
        
        if i % 3 == 0 && dp[i] > dp[i/3] + 1 {
            dp[i] = dp[i/3] + 1
            before[i] = i/3
        }
    }
    
    print(dp[number])
    var result = [number]
    var index = number
    
    while index != 1 {
        result.append(before[index])
        index = before[index]
    }
    
    print(result.map{String($0)}.joined(separator: " "))
}

if number == 1 {
    print(0)
    print(1)
} else{
    solution(number)
}