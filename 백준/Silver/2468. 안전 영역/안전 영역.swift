//
//  main.swift
//  BJ2468
//
//  Created by 안홍범 on 11/3/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = (1...N).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    var visited = Array(
        repeating: Array(repeating: false, count: N),
        count: N
    )
    
    func bfs(_ x: Int, _ y: Int, _ height: Int) {
        var queue = [(x, y)]
        visited[x][y] = true
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= N || ny < 0 || ny >= N { continue } // 범위 체크
                if visited[nx][ny] || arr[nx][ny] <= height { continue } // 방문 여부 체크 및 잠김 여부 체크
                
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    var maxSafeArea = 1
    
    // 0 ~ 100까지 강수량 변화
    for height in 0..<101 {
        visited = Array(
            repeating: Array(repeating: false, count: N),
            count: N
        )
        
        var safeArea = 0
        for i in 0..<N {
            for j in 0..<N {
                if !visited[i][j] && arr[i][j] > height {
                    bfs(i, j, height)
                    safeArea += 1
                }
            }
        }
        
        maxSafeArea = max(maxSafeArea, safeArea)
    }
    
    print(maxSafeArea)
}

solution()
