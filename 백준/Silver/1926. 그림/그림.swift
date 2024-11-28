//
//  main.swift
//  BJ1926
//
//  Created by 안홍범 on 11/28/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let(n ,m) = (input[0], input[1])

let paper = (0..<n).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    // 방문 여부 2차월 배열 생성 (가로 m, 세로 n)
    var visited = Array(
        repeating: Array(repeating: false, count: m),
        count: n
    )
    
    // 이동 방향
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    // BFS
    func bfs(_ x: Int, _  y: Int) -> Int {
        var queue = [(x, y)]
        var count = 1
        var header = 0
        
        visited[x][y] = true
        
        while header < queue.count {
            let (x, y) = queue[header]
            header += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= n || ny < 0 || ny >= m {
                    continue
                }
                
                if !visited[nx][ny] && paper[nx][ny] == 1 {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                    count += 1
                }
            }
        }
        
        return count
    }
    
    var maxArea = 0 // 가장 넓은 그림의 넓이
    var count = 0
        
    for i in 0..<n {
        for j in 0..<m {
            if !visited[i][j] && paper[i][j] == 1 {
                count += 1
                maxArea = max(maxArea, bfs(i, j))
            }
        }
    }
    
    print(count)
    print(maxArea)
}

solution()
