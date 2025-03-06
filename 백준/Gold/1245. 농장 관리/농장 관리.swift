//
//  main.swift
//  BJ_1245
//
//  Created by 안홍범 on 3/5/25.
//

import Foundation

func solution(_ N: Int, _ M: Int, _ map: [[Int]]) -> Int {
    // 인접 -> x,y 좌표 차이가 1 이하인 경우 : 대각선도 고려해야함 (1차 실패 원인)
    var answer = 0
    let dx = [-1, 1, 0, 0, 1, 1, -1, -1]
    let dy = [0, 0, -1, 1, 1, -1, 1, -1]
    var visited = Array(
        repeating: Array(repeating: false, count: M),
        count: N
    )
    
    func bfs(_ x: Int, _ y: Int) -> Bool {
        var queue = [(x, y)]
        var check = true
        var header = 0
        
        visited[x][y] = true
        
        while header < queue.count {
            let (x, y) = queue[header]
            header += 1
            
            for i in 0..<8 { // 8방향 탐색
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= N || ny < 0 || ny >= M {
                    continue
                }
                
                if map[nx][ny] > map[x][y] {
                    // 주변에 더 높은 곳이 있으면 봉우리가 아님
                    check = false
                }
                
                if !visited[nx][ny] && map[nx][ny] == map[x][y] {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
        
        return check
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if !visited[i][j] && bfs(i, j) {
                answer += 1
            }
        }
    }

    return answer
}

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let (N, M) = (input[0], input[1])
var map = [[Int]]()
for _ in 0..<N {
    map.append(
        readLine()!
            .split(separator: " ")
            .map { Int($0)! }
    )
}

print(solution(N, M, map))
