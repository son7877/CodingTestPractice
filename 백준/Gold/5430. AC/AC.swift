//
//  main.swift
//  BJ5430
//
//  Created by 안홍범 on 10/21/24.
//
// 빈 배열 처리를 신경써야 맞출 수 있는 문제인듯 싶다.

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let p = readLine()! // 함수
    let n = Int(readLine()!)! // 배열 개수
    let arr = readLine()!
        .dropFirst()
        .dropLast()
        .split(separator: ",")
        .map{Int($0)!}
    
    solution(p, arr)
}

func solution(_ p: String, _ arr: [Int]) {
    var start = 0
    var end = arr.count
    var isReversed = false
    
    for command in p {
        if command == "R" {
            isReversed.toggle() // bool 값 반전
        } else if command == "D" {
            if start >= end  || arr.isEmpty {
                print("error")
                return
            }
            if isReversed {
                end -= 1
            } else {
                start += 1
            }
        }
    }
    
    if arr.isEmpty || start > end {
        print("[]")
    } else {
        var result = Array(arr[start..<end])
        if isReversed {
            result.reverse()
        }
        print("[\(result.map{String($0)}.joined(separator: ","))]")
    }
}
