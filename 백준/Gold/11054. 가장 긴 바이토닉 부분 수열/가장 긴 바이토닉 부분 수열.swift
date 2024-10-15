//
//  main.swift
//  BJ11054
//
//  Created by 안홍범 on 10/15/24.
//
// 1차 제출: 틀렸습니다.

import Foundation

let length = Int(readLine()!)!

let arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var dp = [Int](repeating: 1, count: length) // 앞에서부터 증가하는 부분 수열의 길이
    var dp2 = [Int](repeating: 1, count: length) // 뒤에서부터 증가하는 부분 수열의 길이
    
    for i in 0..<length { // 앞에서부터 증가하는 부분 수열
        for j in 0..<i {
            if arr[j] < arr[i] {
                dp[i] = max(dp[i], dp[j]+1)
            }
        }
    }
    
    // 1차 실패 원인: stride의 to,through의 차이점 인지 실패
    // to: length-1..<0
    // through: length-1...0
    for i in stride(from: length-1, through: 0, by: -1) { // 뒤에서부터 증가하는 부분 수열
        for j in stride(from: length-1, to: i, by: -1) {
            if arr[j] < arr[i] {
                dp2[i] = max(dp2[i], dp2[j]+1)
            }
        }
    }
    
    var result = 0
    for i in 0..<length {
        result = max(result, dp[i] + dp2[i])
    }
    
    print(result-1)
}

solution()