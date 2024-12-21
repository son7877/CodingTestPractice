//
//  main.swift
//  BJ15954
//
//  Created by 안홍범 on 12/21/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map({Int($0)!})

let (N, K) = (input[0], input[1])

let arr = readLine()!
    .split(separator: " ")
    .map({Double($0)!})

func solution() {
    var result = Double.greatestFiniteMagnitude // 표현할 수 있는 가장 큰 값

    for i in 0...N-K {
        for j in K...N-i {
            let subArr = Array(arr[i..<i+j]) // i부터 j개의 원소를 가진 배열
            let average = subArr.reduce(0, +) / Double(j) // 평균
            let variance = subArr.map({ pow($0 - average, 2) }).reduce(0, +) / Double(j) // 분산
            result = min(result, variance) // 분산값 비교 후 작은 값 저장
        }
    }
    
    print(sqrt(result))
}

solution()
