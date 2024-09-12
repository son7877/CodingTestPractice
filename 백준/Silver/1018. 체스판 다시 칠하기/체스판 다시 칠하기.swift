//
//  main.swift
//  BJ1018
//
//  Created by 안홍범 on 9/7/24.
//

import Foundation

let size = readLine()!.split(separator: " ").map{Int($0)!}

var board = [[Character]]()

for _ in 0..<size[0] { // 수정: 0..<size[0]
    board.append(Array(readLine()!))
}

var answer = 64

for y in 0..<size[0] - 7 { // 수정: 0..<size[0] - 7
    for x in 0..<size[1] - 7 { // 수정: 0..<size[1] - 7
        var count1 = 0
        var count2 = 0
        
        for col in y..<y + 8 {
            for row in x..<x + 8 {
                if (col + row) % 2 == 0 {
                    if board[col][row] == "B" {
                        count2 += 1
                    } else {
                        count1 += 1
                    }
                } else {
                    if board[col][row] == "B" {
                        count1 += 1
                    } else {
                        count2 += 1
                    }
                }
            }
        }
        answer = min(answer, count2, count1)
    }
}

print(answer)
