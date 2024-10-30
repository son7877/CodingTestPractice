//
//  main.swift
//  BJ14888
//
//  Created by 안홍범 on 10/30/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var maxResult = Int.min 
    var minResult = Int.max

    func dfs(_ idx: Int, _ result: Int, _ add: Int, _ sub: Int, _ mul: Int, _ div: Int) {
        if idx == N {
            maxResult = max(maxResult, result)
            minResult = min(minResult, result)
            return
        }

        if add > 0 {
            dfs(idx+1, result+arr[idx], add-1, sub, mul, div)
        }
        if sub > 0 {
            dfs(idx+1, result-arr[idx], add, sub-1, mul, div)
        }
        if mul > 0 {
            dfs(idx+1, result*arr[idx], add, sub, mul-1, div)
        }
        if div > 0 {
            dfs(idx+1, result/arr[idx], add, sub, mul, div-1)
        }
    }

    dfs(1, arr[0], input[0], input[1], input[2], input[3])

    print(maxResult)
    print(minResult)
}

solution()
