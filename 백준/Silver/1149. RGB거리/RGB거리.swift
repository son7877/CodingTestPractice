//
//  main.swift
//  BJ1149
//
//  Created by 안홍범 on 9/29/24.
//

import Foundation

let houses = Int(readLine()!)!

var colorCost = [[Int]]()

for _ in 0..<houses {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    colorCost.append(input)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: houses)

for i in 0..<houses {
    if i == 0 {
        dp[i] = colorCost[i]
    } else {
        dp[i][0] = min(dp[i - 1][1], dp[i - 1][2]) + colorCost[i][0]
        dp[i][1] = min(dp[i - 1][0], dp[i - 1][2]) + colorCost[i][1]
        dp[i][2] = min(dp[i - 1][0], dp[i - 1][1]) + colorCost[i][2]
    }
}

print(dp[houses - 1].min()!)
