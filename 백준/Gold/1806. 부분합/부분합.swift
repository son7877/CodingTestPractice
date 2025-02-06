//
//  main.swift
//  BJ1806
//
//  Created by 안홍범 on 2/6/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let (N, S) = (input[0], input[1])
let arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    // 연속된 수를 더해서 S값 이상 만들 수 있는 가장 짧은 길이 구하기
    var left = 0
    var right = 0
    var sum = 0
    var minLen = Int.max
    
    while true {
        if sum >= S {
            minLen = min(minLen, right - left)
            sum -= arr[left]
            left += 1
        } else if right == N {
            break
        } else {
            sum += arr[right]
            right += 1
        }
    }
    
    print(minLen == Int.max ? 0 : minLen)
}

solution()

