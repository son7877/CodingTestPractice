//
//  main.swift
//  BJ16953
//
//  Created by 안홍범 on 10/3/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (A,B) = (input[0],input[1])

func solution() { // 역으로 접근 B->A
    var result = 1
    var B = B
    
    while A < B {
        if B % 10 == 1 {
            B /= 10
        } else if B % 2 == 0 {
            B /= 2
        } else {
            break
        }
        result += 1
    }
    
    if A == B {
        print(result)
    } else {
        print(-1)
    }
}

solution()

