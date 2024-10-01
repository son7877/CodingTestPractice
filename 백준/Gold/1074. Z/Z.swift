//
//  main.swift
//  BJ1074
//
//  Created by 안홍범 on 10/1/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{(Int($0)!)}

let (N,r,c) = (input[0],input[1],input[2])

var result = 0

// 행과 열 0부터 시작
func Z(_ N:Int, _ r:Int, _ c:Int) {
    let div = 1 << N // 2^N
    let block = div * div // 한 블록의 크기
    
    result += block * (r / div * 2 + c / div) // 블록의 시작점을 더함
    if (N>0) {
        Z(N-1, r % div, c % div)
    }
}

Z(N, r, c)
print(result)
