//
//  main.swift
//  BJ2573
//
//  Created by 안홍범 on 11/28/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])

var iceberg = (0..<N).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

var year = 0

func solution() {
    // 빙산의 개수 확인(BFS)후 빙산을 녹이는 과정을 조건(빙산이 2개 이상이면 종료)을 만족할 때까지 반복
    // 종료 후 년 수 출력하기
    while true {
        if countIceberg() >= 2 { // 빙산의 개수가 2개 이상이면 종료
            print(year)
            break
        } else if countIceberg() == 0 { // 빙산이 없으면 종료
            print(0)
            break
        } else {
            meltIceberg() // 빙산 녹이기
        }
    }
}

func countIceberg() -> Int { // 연결되어 있는 빙산의 개수 확인 함수
    var visited = Array(
        repeating: Array(repeating: false, count: M),
        count: N
    )
    
    var count = 0
    
    for i in 0..<N {
        for j in 0..<M {
            if iceberg[i][j] > 0 && !visited[i][j] {
                bfs(i, j, &visited)
                count += 1
            }
        }
    }
    
    return count
}

func bfs(_ x: Int, _ y: Int, _ visited: inout [[Bool]]) { // BFS
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    var queue = [(x, y)]
    var header = 0
    
    visited[x][y] = true
    
    while header < queue.count {
        let (x, y) = queue[header]
        header += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= N || ny < 0 || ny >= M {
                continue
            }
            
            if iceberg[nx][ny] > 0 && !visited[nx][ny] {
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
}

func meltIceberg() { // 빙산 녹이기 (0과 접촉될 때마다 빙산의 높이 1 감소)
    year += 1
    var temp = Array(
        repeating: Array(repeating: 0, count: M),
        count: N
    )
    
    for i in 0..<N {
        for j in 0..<M {
            if iceberg[i][j] > 0 {
                var count = 0
                
                // 바다와 접촉된 면의 개수 확인
                if i > 0 && iceberg[i - 1][j] == 0 {
                    count += 1
                }
                
                if i < N - 1 && iceberg[i + 1][j] == 0 {
                    count += 1
                }
                
                if j > 0 && iceberg[i][j - 1] == 0 {
                    count += 1
                }
                
                if j < M - 1 && iceberg[i][j + 1] == 0 {
                    count += 1
                }
                
                temp[i][j] = max(0, iceberg[i][j] - count)
            }
        }
    }
    
    iceberg = temp
}

solution()
