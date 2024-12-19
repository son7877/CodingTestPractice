//
//  main.swift
//  BJ1011
//
//  Created by 안홍범 on 12/18/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let input = readLine()!
        .split(separator: " ")
        .map({ Int($0)! })
    
    let (X, Y) = (input[0], input[1])
    solution(X: X, Y: Y)
}

func solution(X: Int, Y: Int) {
    let distance = Y - X
    let sqrtDistance = Int(sqrt(Double(distance)))

    if distance == sqrtDistance * sqrtDistance {
        print(2 * sqrtDistance - 1)
    } else if distance <= sqrtDistance * sqrtDistance + sqrtDistance {
        print(2 * sqrtDistance)
    } else {
        print(2 * sqrtDistance + 1)
    }
}
