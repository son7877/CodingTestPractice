//
//  main.swift
//  BJ21736
//
//  Created by 안홍범 on 10/6/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])

var campus = (0..<N).map{ _ in
    readLine()!.map{String($0)}
}

func solution() -> Any {
    var answer = 0
    let failure = "TT"
    
    // 상하 좌우 이동
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    // O: 지나갈 수 있는 곳, X: 지나갈 수 없는 곳, P: 사람, I: 현 위치
    func bfs(_ x: Int, _ y: Int) {
        var queue = [(x, y)]
        var visited = Array(repeating: Array(repeating: false, count: M), count: N)
        visited[x][y] = true
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= N || ny < 0 || ny >= M {
                    continue
                }
                
                if visited[nx][ny] || campus[nx][ny] == "X" {
                    continue
                }
                
                if campus[nx][ny] == "P" {
                    answer += 1
                }
                
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if campus[i][j] == "I" {
                bfs(i, j)
            }
        }
    }
    
    if answer == 0 {
        return failure
    } else {
        return answer
    }
}

print(solution())
