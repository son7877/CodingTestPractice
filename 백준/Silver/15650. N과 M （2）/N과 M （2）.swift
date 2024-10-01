//
//  main.swift
//  BJ15650
//
//  Created by 안홍범 on 10/1/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N,M) = (input[0],input[1])

var result = [Int]()

func solution() {
    if result.count == M {
        print(result.map{String($0)}.joined(separator: " "))
    }
    
    for i in 1...N {
        if result.isEmpty || result.last! < i {
            result.append(i)
            solution()
            result.removeLast() // result 배열에 추가된 값을 다시 제거해줘야 다음 for문에서 다음 값이 추가됨
        }
    }
}

solution()
