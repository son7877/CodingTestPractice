//
//  main.swift
//  BJ1051
//
//  Created by 안홍범 on 11/26/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])

let map = (0..<N).map{_ in
    readLine()!
        .map{Int(String($0))!}
}

func solution() {
    var max = 0
    for i in 0..<N {
        for j in 0..<M {
            for k in 1..<min(N, M) {
                if i+k < N, j+k < M {
                    if map[i][j] == map[i+k][j] && map[i][j] == map[i][j+k] && map[i][j] == map[i+k][j+k] { // 정사각형 확인
                        max = max < k ? k : max
                    }
                }
            }
        }
    }
    print((max+1) * (max+1))
}

solution()
