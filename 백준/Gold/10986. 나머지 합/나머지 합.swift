//
//  main.swift
//  BJ10986
//
//  Created by 안홍범 on 11/12/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N,M) = (input[0], input[1])

let N_arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    // 합_나머지 배열 생성
    var sum_arr: [Int] = Array(repeating: 0, count: N)

    for i in 0..<N {
        if i == 0 {
            sum_arr[i] = N_arr[i] % M
        } else {
            sum_arr[i] = (sum_arr[i-1] + N_arr[i]) % M
        }
    }
    
    // 합_나머지 배열의 원소의 값이 0인 경우 더하기
    var count = 0
    for i in 0..<N {
        if sum_arr[i] == 0 {
            count += 1
        }
    }
    
    // 합_나머지 배열의 원소의 값이 같은 경우 더하기
    var dict = [Int: Int]()
    for i in 0..<N {
        if dict[sum_arr[i]] == nil {
            dict[sum_arr[i]] = 1
        } else {
            dict[sum_arr[i]]! += 1
        }
    }
    
    for (_, value) in dict {
        count += value * (value-1) / 2
    }
    
    print(count)
}

solution()
