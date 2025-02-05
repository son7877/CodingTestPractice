//
//  main.swift
//  BJ1117
//
//  Created by 안홍범 on 2/5/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (W, H, f, c, x1, y1, x2, y2) = (input[0], input[1], input[2], input[3], input[4], input[5], input[6], input[7])

func solution() {
    // 전체 종이의 넓이
    let paper = W * H
    
    let boundary = min(W-f, f) // 중첩된 맨 오른쪽 좌표
    var k = 0
    
    if x1 <= boundary && boundary <= x2 {
        k = 2 * (boundary-x1) + (x2-boundary)
    } else if boundary <= x1 {
        k = x2 - x1
    } else {
        k = 2 * (x2 - x1)
    }
    
    print(paper - (k * (c+1) * (y2-y1))) // 전체 종이 넓이 - 중첩된 종이 넓이
}


solution()
