//
//  main.swift
//  BJ1654
//
//  Created by 안홍범 on 10/16/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (K, N) = (input[0], input[1])

var arr = Array<Int>()

for _ in 0..<K{
    arr.append(Int(readLine()!)!)
}

arr.sort(by: >)

func solution() {
    var left = 1
    var right = arr[0]
    var result = 0
    
    while left <= right {
        var count = 0
        let mid = (left + right) / 2
        
        for i in 0..<K {
            count += arr[i] / mid
        }
        
        if count >= N { // 랜선의 개수가 더 많거나 같은 경우
            result = mid
            left = mid + 1 // 랜선의 길이를 더 늘려서 최대 길이에 도달하도록 함
        } else { // 랜선의 개수가 더 적은 경우
            right = mid - 1
        }
    }
    
    print(result)
}

solution()
