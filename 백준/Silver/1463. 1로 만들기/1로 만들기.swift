//
//  main.swift
//  BJ1463
//
//  Created by 안홍범 on 9/12/24.
//

import Foundation

let num = Int(readLine()!)!

var dp: [Int] = Array(repeating: 0, count: num + 1)

dp[1] = 0
if num>1 {
    dp[2] = 1
}
if num>2 {
    dp[3] = 1
}

if(num>3){
    for i in 4...num {
        dp[i] = dp[i-1] + 1
        if i % 2 == 0 {
            dp[i] = min(dp[i], dp[i/2] + 1)
        }
        if i % 3 == 0 {
            dp [i] = min(dp[i], dp[i/3] + 1)
        }
    }
}

print(dp[num])


