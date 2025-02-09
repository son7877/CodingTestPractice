//
//  main.swift
//  BJ14003
//
//  Created by 안홍범 on 2/6/25.
//

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

var dp = [Int]() // dp[i] : 길이가 i인 증가하는 부분 수열 중 마지막 수의 최솟값
var indices = [Int]() // dp[i]의 인덱스
var prev = [Int](repeating: -1, count: N) // 이전 인덱스

func solution() {
    for i in 0..<N {
        let value = arr[i]
        let pos = binarySearch(value)
        
        if pos < dp.count {
            dp[pos] = value
            indices[pos] = i
        } else {
            dp.append(value)
            indices.append(i)
        }
        
        if pos > 0 {
            prev[i] = indices[pos-1]
        }
    }
    
    var answer = [Int]()
    var index = indices.last!
    while index != -1 {
        answer.append(arr[index])
        index = prev[index]
    }
    answer.reverse()
    
    print(answer.count)
    print(answer.map{String($0)}.joined(separator: " "))
}

func binarySearch(_ target: Int) -> Int {
    var start = 0
    var end = dp.count
    
    while start < end {
        let mid = (start + end) / 2
        
        if dp[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return end
}

solution()
