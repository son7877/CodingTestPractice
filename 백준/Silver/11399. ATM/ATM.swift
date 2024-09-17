//
//  main.swift
//  BJ11399
//
//  Created by 안홍범 on 9/17/24.
//

import Foundation

let people = Int(readLine()!)!

var time = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
    .sorted()

var sum = Array(repeating: 0, count: people)

for i in 0..<people {
    for j in 0...i {
        sum[i] += time[j]
    }
}

print(sum.reduce(0, +))




