//
//  main.swift
//  BJ9465
//
//  Created by 안홍범 on 10/7/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let n = Int(readLine()!)!
    
    // 2행 n열의 스티커 점수
    let arr = (0..<2).map{ _ in
        readLine()!.split(separator: " ")
            .map{Int($0)!}
    }
    
    // 스티커를 떼면 인접한 스티커는 사용하지 못함 -> 대각선으로 접근
    func solution() -> Any {
        var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
        
        // 초기값 설정
        dp[0][0] = arr[0][0]
        dp[1][0] = arr[1][0]
        
        // n이 1일 때는 초기값 설정 후 바로 리턴
        if n == 1 {
            return max(dp[0][0], dp[1][0])
        }
        
        // n이 2일 때는 대각선으로 접근하여 값을 더함
        dp[0][1] = arr[0][1] + dp[1][0]
        dp[1][1] = arr[1][1] + dp[0][0]
        
        for i in 2..<n {
            dp[0][i] = arr[0][i] + max(dp[1][i-1], dp[1][i-2])
            dp[1][i] = arr[1][i] + max(dp[0][i-1], dp[0][i-2])
        }
        
        return max(dp[0][n-1], dp[1][n-1])
    }
    
    print(solution())
}
