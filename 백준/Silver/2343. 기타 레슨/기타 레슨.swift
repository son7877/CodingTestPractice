//
//  main.swift
//  BJ2343
//
//  Created by 안홍범 on 10/16/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N,M) = (input[0], input[1])
let lessons = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    // 최대 레슨 시간 ~ 모든 레슨 시간의 합
    var left = lessons.max()!
    var right = lessons.reduce(0,+)
    var result = 0
    
    while left <= right {
        let mid  = (left + right) / 2
        var sum = 0
        var count = 1
        
        for i in lessons {
            if sum + i > mid {
                count += 1
                sum = 0
            }
            sum += i
        }
        
        if count <= M {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    print(result)
}

solution()
