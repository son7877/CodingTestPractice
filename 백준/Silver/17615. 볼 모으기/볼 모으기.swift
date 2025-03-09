//
//  main.swift
//  BJ_17615
//
//  Created by 안홍범 on 3/9/25.
//

import Foundation

let N = Int(readLine()!)!
var balls = readLine()!


func solve(_ balls: [Character], _ ball: Character) -> Int {
    var left = 0
    var right = 0
    var flag = false

    // 왼쪽에서 오른쪽으로 탐색
    for i in 0..<balls.count {
        if balls[i] == ball {
            flag = true
        } else {
            if flag {
                left += 1
            }
        }
    }

    flag = false

    // 오른쪽에서 왼쪽으로 탐색
    for i in stride(from: balls.count - 1, through: 0, by: -1) {
        if balls[i] == ball {
            flag = true
        } else {
            if flag {
                right += 1
            }
        }
    }

    return min(left, right)
}

let answer = min(solve(Array(balls), "B"), solve(Array(balls), "R"))
print(answer)
