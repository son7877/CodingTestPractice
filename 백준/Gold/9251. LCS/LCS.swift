//
//  main.swift
//  BJ9251
//
//  Created by 안홍범 on 10/12/24.
//
// 1차 제출: 런타임 에러
// 원인: dp 배열의 크기를 잘못 설정함

import Foundation

var string1 = Array(readLine()!)
var string2 = Array(readLine()!)

func solution(){
    var dp = Array(repeating:
                    Array(repeating: 0,
                          count: string1.count+1),
                   count: string2.count+1)
    
    for i in 1...string2.count {
        for j in 1...string1.count {
            if string1[j-1] == string2[i-1]{
                dp[i][j] = dp[i-1][j-1] + 1 // 대각선 값 +1
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]) // 왼쪽과 위쪽 중 최대값
            }
        }
    }
    
    // 마지막 값이 최대 공통 부분 수열의 길이
    print(dp[string2.count][string1.count])
}

solution()

