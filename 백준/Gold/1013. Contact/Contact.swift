//
//  main.swift
//  BJ1013
//
//  Created by 안홍범 on 12/28/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let input = readLine()!
    
    solution(input: input)
}

func solution(input: String) {
    let pattern = "^(100+1+|01)+$"
    if input.range(of: pattern, options: .regularExpression) != nil {
        print("YES")
    } else {
        print("NO")
    }
}
