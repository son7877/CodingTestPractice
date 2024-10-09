//
//  main.swift
//  BJ11660
//
//  Created by 안홍범 on 10/9/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])

let arr = (0..<N).map{ _ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

let coordinates = (0..<M).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    var dp = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
    
    for i in 1...N {
        for j in 1...N {
            // (1,1) ~ (i,j) 까지의 합
            dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + arr[i-1][j-1]
        }
    }
    
    for coordinate in coordinates {
        let (x1, y1, x2, y2) = (coordinate[0], coordinate[1], coordinate[2], coordinate[3])
        
        print(dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1]) // (x1, y1) ~ (x2, y2) 사이의 합
    }
}

solution()

