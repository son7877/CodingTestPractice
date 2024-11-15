//
//  main.swift
//  BJ17298
//
//  Created by 안홍범 on 11/15/24.
//

import Foundation

// 오큰수: 오른쪽에 있으면서 자신보다 큰 수 중 가장 왼쪽에 있는 수

let N = Int(readLine()!)!

let N_arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var stack = [Int]()
    var result = Array(repeating: -1, count: N)
    
    for i in 0..<N {
        // 스택이 비어있지 않고, 현재 수가 스택의 가장 위의 수보다 클 때
        while !stack.isEmpty && N_arr[stack.last!] < N_arr[i] {
            result[stack.remove(at: stack.count-1)] = N_arr[i]
        }
        stack.append(i)
    }
    
    print(result.map{String($0)}.joined(separator: " "))
}

solution()
