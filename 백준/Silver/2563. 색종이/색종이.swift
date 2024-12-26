//
//  main.swift
//  BJ2563
//
//  Created by 안홍범 on 12/26/24.
//

import Foundation

// 도화지의 전체 넓이는 100*100으로 고정
// 색종이는 100개까지, 크기는 10*10으로 고정, 도화지를 벗어나지 않음

let num = Int(readLine()!)!
var paper = Array(repeating:
                    Array(repeating: 0, count: 100),
                  count: 100) // 도화지(2차원 배열) 생성

for _ in 1...num {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (x, y) = (input[0], input[1])
    
    for i in y..<y+10 {
        for j in x..<x+10 { // 색종이를 붙이는 부분을 1로 표시
            paper[i][j] = 1
        }
    }
}

var result = 0

for i in 1..<100 {
    for j in 1..<100 {
        if paper[i][j] == 1 {
            result += 1
        }
    }
}

print(result)


