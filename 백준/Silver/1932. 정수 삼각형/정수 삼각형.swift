//
//  main.swift
//  BJ1932
//
//  Created by 안홍범 on 10/7/24.
//

import Foundation

let n = Int(readLine()!)!

let arr = (0..<n).map{ _ in
    readLine()!.split(separator: " ")
        .map{Int($0)!}
}

func solution() -> Any {
    var dp = arr
    for i in 1..<n {
        for j in 0..<arr[i].count {
            if j == 0 {
                dp[i][j] = dp[i-1][j] + arr[i][j]
            } else if j == arr[i].count-1 {
                dp[i][j] = dp[i-1][j-1] + arr[i][j]
            } else {
                dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]
            }
        }
    }
    return dp[n-1].max()!
}

print(solution())
