//
//  main.swift
//  BJ1041
//
//  Created by 안홍범 on 1/1/25.
//

import Foundation

let N = Int(readLine()!)!

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var min1 = min(input[0], input[5])
    var min2 = min(input[1], input[4])
    var min3 = min(input[2], input[3])
    
    var sortedInput = [min1, min2, min3].sorted{ $0 < $1 }
    
    var num1 = sortedInput[0]
    var num2 = sortedInput[0] + sortedInput[1]
    var num3 = sortedInput[0] + sortedInput[1] + sortedInput[2]
    
    if N == 1 {
        print(input.reduce(0, +) - input.max()!)
    } else {
        var result = 0
        result += num1 * (5 * N * N - 16 * N + 12)
        result += num2 * (8 * N - 12)
        result += num3 * 4
        
        print(result)
    }
}

solution()
