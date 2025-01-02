//
//  main.swift
//  BJ1072
//
//  Created by 안홍범 on 1/2/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (X, Y) = (input[0], input[1])

func solution() {
    var Z = Int(Double(Y) * 100 / Double(X))
    
    if Z >= 99 {
        print(-1)
    } else {
        var left = 1
        var right = 1000000000
        var result = 0
        
        while left <= right {
            let mid = (left + right) / 2
            let temp = Int(Double(Y + mid) * 100 / Double(X + mid))
            
            if temp > Z {
                result = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        print(result)
    }
}

solution()
