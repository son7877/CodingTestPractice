//
//  main.swift
//  BJ18870
//
//  Created by 안홍범 on 9/22/24.
//
// 1차 제출 : 시간 초과
// 원인 추론 : 시간 복잡도 O(N^2)으로 인한 시간초과 -> set.firstIndex(of: input[i])! 에서 걸리는 듯

import Foundation

let N = Int(readLine()!)!

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let set = Set(input).sorted()

var compress = [Int:Int]()

for (i, v) in set.enumerated() {
    compress[v] = i
}

let result = input.map { compress[$0]! }

print(result.map { String($0) }.joined(separator: " "))
