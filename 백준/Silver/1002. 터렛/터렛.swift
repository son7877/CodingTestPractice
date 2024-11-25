//
//  main.swift
//  BJ1002
//
//  Created by 안홍범 on 11/25/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let input = readLine()!
        .split(separator: " ")
        .map {Int($0)!}
    
    let (x1, y1, r1, x2, y2, r2) = (input[0], input[1], input[2], input[3], input[4], input[5])
    
    solution(x1, y1, r1, x2, y2, r2)
}

func solution(_ x1: Int, _ y1: Int, _ r1: Int, _ x2: Int, _ y2: Int, _ r2: Int) {
    let distance = sqrt(pow(Double(x2 - x1), 2) + pow(Double(y2 - y1), 2))
    
    // 원의 접점의 개수 -> 0개, 1개, 2개, 무한대(두 원이 일치할 경우)
    if x1 == x2, y1 == y2, r1 == r2 {
        print(-1)
    } else if distance > Double(r1 + r2) || distance < Double(abs(r1 - r2)) {
        print(0)
    } else if distance == Double(r1 + r2) || distance == Double(abs(r1 - r2)) {
        print(1)
    } else {
        print(2)
    }
}
