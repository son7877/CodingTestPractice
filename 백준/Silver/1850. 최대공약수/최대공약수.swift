//
//  main.swift
//  BJ1850
//
//  Created by 안홍범 on 11/22/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (a, b) = (input[0], input[1])

func solution() {
    let result = String(repeating: "1", count: gcd(a, b))
    
    print(result)
}

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    return gcd(b, a % b)
}

solution()
