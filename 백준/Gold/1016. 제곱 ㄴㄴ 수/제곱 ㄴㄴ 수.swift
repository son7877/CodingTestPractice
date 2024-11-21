//
//  main.swift
//  BJ1016
//
//  Created by 안홍범 on 11/21/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (min, max) = (input[0], input[1])

func solution() {
    var check = Array(repeating: true, count: max-min+1) // min ~ max 까지의 제곱수 판별
    var count = 0
    
    for i in 2...1_000_000 {
        let square = i * i
        if square > max {
            break
        }
        
        var start = (min % square == 0 ? min / square : min / square + 1)
        while start * square <= max { // min 이상 max 이하의 제곱수
            check[start * square - min] = false
            start += 1
        }
    }
    
    for i in 0..<check.count {
        if check[i] {
            count += 1
        }
    }
    
    print(count)
}

solution()
