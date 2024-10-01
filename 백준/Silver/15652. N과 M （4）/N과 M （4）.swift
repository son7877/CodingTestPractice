//
//  main.swift
//  BJ15652
//
//  Created by 안홍범 on 10/1/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N,M) = (input[0],input[1])

var result = [Int]()

func solution() {
    if result.count == M {
        print(result.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in 1..<N+1 {
        if result.isEmpty || result.last! <= i {
            result.append(i)
            solution()
            result.removeLast()
        }
    }
}

solution()
