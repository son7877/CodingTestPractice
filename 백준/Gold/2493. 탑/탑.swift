//
//  main.swift
//  BJ2493
//
//  Created by 안홍범 on 11/6/24.
//

import Foundation

let N = Int(readLine()!)!

let tower = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

func solution() {
    var stack = [(Int, Int)]()
    var result = [Int](repeating: 0, count: N)

    for i in 0..<N {
        while !stack.isEmpty {
            if stack.last!.1 > tower[i] { // 현재 탑보다 높은 탑이 있으면
                result[i] = stack.last!.0 + 1 // 인덱스는 1부터 시작하므로 +1
                break
            }
            stack.removeLast()
        }
        stack.append((i, tower[i]))
    }

    print(result.map { String($0) }.joined(separator: " "))
}

solution()
