//
//  main.swift
//  BJ15663
//
//  Created by 안홍범 on 10/1/24.
//
// 1차 실패: 중복 관리 신경쓰지 못함

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int(String($0))!}

let (N,M) = (input[0],input[1])

let N_arr = readLine()!
    .split(separator: " ")
    .map{Int(String($0))!}
    .sorted()

var result = [String]()
var check = Set<String>()
var visited = Array(repeating: false, count: N)

func solution() {
    if result.count == M {
        let str = result.joined(separator: " ")
        if !check.contains(str) {
            check.insert(str)
            print(str)
        }
        return
    }
    
    for i in 0..<N {
        if !visited[i] {
            visited[i] = true
            result.append(String(N_arr[i]))
            solution()
            result.removeLast()
            visited[i] = false
        }
    }
}

solution()

