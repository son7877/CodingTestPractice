//
//  main.swift
//  BJ9184
//
//  Created by 안홍범 on 11/30/24.
//

import Foundation

while true {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (a, b, c) = (input[0], input[1], input[2])
    
    if a == -1 && b == -1 && c == -1 {
        break
    }
    
    solution(a, b, c)
}

func solution(_ a: Int, _ b: Int, _ c: Int) {
    var dp = Array(
        repeating: Array(
            repeating: Array(repeating: 0, count: 21),
            count: 21
        ),
        count: 21
    )
    
    func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
        if a <= 0 || b <= 0 || c <= 0 {
            return 1
        }
        
        if a > 20 || b > 20 || c > 20 {
            return w(20, 20, 20)
        }
        
        if dp[a][b][c] != 0 {
            return dp[a][b][c]
        }
        
        if a < b && b < c {
            dp[a][b][c] = w(a, b, c - 1) + w(a, b - 1, c - 1) - w(a, b - 1, c)
        } else {
            dp[a][b][c] = w(a - 1, b, c) + w(a - 1, b - 1, c) + w(a - 1, b, c - 1) - w(a - 1, b - 1, c - 1)
        }
        
        return dp[a][b][c]
    }
    
    print("w(\(a), \(b), \(c)) = \(w(a, b, c))")
}
