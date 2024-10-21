//
//  main.swift
//  BJ6064
//
//  Created by 안홍범 on 10/20/24.
//
// 1차 제출 -> 시간 초과 

import Foundation

let T = Int(readLine()!)!

for _ in 1...T {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (M,N,x,y) = (input[0], input[1], input[2], input[3])
    solution(M, N, x, y)
}

func solution(_ M: Int, _ N: Int, _ x: Int, _ y: Int) {
    let x = x
    let y = y
    var year = x
    
    while year <= M*N {
        if (year-y) % N == 0 {
            print(year)
            return
        }
        year += M
    }
    print(-1)
}

