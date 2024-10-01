//
//  main.swift
//  BJ15654
//
//  Created by 안홍범 on 10/1/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let (N,M) = (input[0],input[1])
let N_arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
    .sorted()

var result = [Int]()

func solution() {
    if result.count == M {
        print(result.map{String($0)}.joined(separator: " "))
    }
    
    for i in N_arr {
        if result.isEmpty || !result.contains(i) {
            result.append(i)
            solution()
            result.removeLast()
        }
    }
}

solution()


