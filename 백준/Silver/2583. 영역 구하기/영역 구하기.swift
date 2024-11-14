//
//  main.swift
//  BJ2583
//
//  Created by 안홍범 on 11/14/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (M, N, K) = (input[0], input[1], input[2])

let map = (0..<K).map { _ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    var visited = Array(
        repeating: Array(repeating: false, count: N),
        count: M
    )
    
    var area = [Int]()
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    func bfs(_ x: Int, _ y: Int) -> Int {
        var queue = [(x, y)]
        var count = 1
        
        visited[x][y] = true
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= M || ny < 0 || ny >= N {
                    continue
                }
                
                if !visited[nx][ny] {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                    count += 1
                }
            }
        }
        
        return count
    }
    
    for i in 0..<K {
        let (x1, y1, x2, y2) = (map[i][0], map[i][1], map[i][2], map[i][3])
        
        for x in x1..<x2 {
            for y in y1..<y2 {
                visited[y][x] = true
            }
        }
    }
    
    for x in 0..<M {
        for y in 0..<N {
            if !visited[x][y] {
                area.append(bfs(x, y))
            }
        }
    }
    
    print(area.count)
    print(area.sorted().map{String($0)}.joined(separator: " "))
}

solution()
