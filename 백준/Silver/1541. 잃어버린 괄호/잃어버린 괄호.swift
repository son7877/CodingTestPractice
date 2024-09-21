//
//  main.swift
//  BJ1541
//
//  Created by 안홍범 on 9/21/24.
//
// 1차 생각 : - 기호 기준으로 2차원 배열을 구성하기
// 1차 시도 : 틀렸습니다.
// 원인: -기호가 없는 경우를 생각을 못했다.

import Foundation

// - 기호를 기준으로 원소 나누기
var input = readLine()!
    .split(separator: "-")
    .map{ $0.split(separator: "+")
        .map{ Int($0)! } }
var sum = 0

for i in 0..<input.count {
    if i == 0 {
        sum += input[i].reduce(0, +)
    } else {
        sum -= input[i].reduce(0, +)
    }
}

print(sum)
