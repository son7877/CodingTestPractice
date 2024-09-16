//
//  main.swift
//  BJ9095
//
//  Created by 안홍범 on 9/12/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let num = Int(readLine()!)!
    
    var dp: [Int] = Array(repeating: 0, count: num + 1)
    
    dp[1] = 1
    
    if num>1 {
        dp[2] = 2
    }
    
    if num>2 {
        dp[3] = 4
    }
    
    if num>3 {
        for i in 4...num {
            dp[i] = dp[i-1]+dp[i-2]+dp[i-3]
        }
    }
    print(dp[num])
}
