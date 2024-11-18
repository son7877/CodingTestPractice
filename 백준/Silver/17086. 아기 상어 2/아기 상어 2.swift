//
//  main.swift
//  BJ17086
//
//  Created by 안홍범 on 11/18/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])

// 0: 빈 칸, 1: 아기 상어
let map = (1...N).map { _ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
    let dy = [-1, 0, 1, -1, 1, -1, 0, 1]
    
    var queue = [(Int, Int, Int)]()
    var visited = Array(
        repeating:
            Array(repeating: false, count: M),
        count: N
    )
    
    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] == 1 { // 아기 상어가 위치한 곳
                queue.append((i, j, 0))
                visited[i][j] = true
            }
        }
    }
    
    var result = 0
    while !queue.isEmpty {
        let (x, y, dist) = queue.removeFirst()
        
        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= N || ny < 0 || ny >= M {
                continue
            }
            
            if visited[nx][ny] {
                continue
            }
            
            visited[nx][ny] = true
            queue.append((nx, ny, dist+1))
            result = max(result, dist+1)
        }
    }
    
    print(result)
}

solution()
