//
//  main.swift
//  BJ11659
//
//  Created by 안홍범 on 9/20/24.
//
// 누적합

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{(Int($0)!)}

var arr = [0] + readLine()!
    .split(separator: " ")
    .map{(Int($0)!)}

for i in 1..<arr.count {
    arr[i] += arr[i - 1]
}

for _ in 0..<input[1] {
    let query = readLine()!
        .split(separator: " ")
        .map{(Int($0)!)}
    
    print(arr[query[1]] - arr[query[0] - 1])
}
