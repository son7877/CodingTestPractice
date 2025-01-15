//
//  main.swift
//  BJ1052
//
//  Created by 안홍범 on 1/15/25.
//
// 1차 제출 : 시간 초과

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map {Int($0)!}

let (N, K) = (input[0], input[1])

solution(N: N, K: K)

func solution(N: Int, K: Int) {
    var count = 0
    var result = N
    
    while true {
        let oneCount = result.nonzeroBitCount
        
        if oneCount <= K {
            break
        }
        
        result += 1
        count += 1
    }
    
    print(count)
}
