//
//  main.swift
//  BJ1629
//
//  Created by 안홍범 on 10/3/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (A,B,C) = (input[0],input[1],input[2])

func solution(_ A:Int, _ B:Int, _ C:Int) -> Int {
    if B == 0 {
        return 1
    }
    
    let n = solution(A, B/2, C)
    
    if B % 2 == 0 {
        return n * n % C
    } else {
        return n * n % C * A % C
    }
}

print(solution(A,B,C))
