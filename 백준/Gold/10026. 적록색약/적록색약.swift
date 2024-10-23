//
//  main.swift
//  BJ10026
//
//  Created by 안홍범 on 10/23/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = (1...N).map{_ in
    readLine()!
        .map{String($0)}
}

// 적록색약 -> 빨강=초록, 나머지 -> 빨강!=초록
func solution() {
    var queue = [(Int, Int)]()
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    var visited1 = Array(
        repeating:
            Array(repeating: false, count: N),
        count: N
    )
    var visited2 = Array(
        repeating:
            Array(repeating: false, count: N),
        count: N
    )
    var area1 = 0 // 적록색약이 아닌 사람이 보이는 구역의 수
    var area2 = 0 // 적록색약인 사람이 보이는 구역의 수
    
    for i in 0..<N { // 적록색약이 아닌 사람
        for j in 0..<N {
            if !visited1[i][j] { // 방문하지 않은 곳
                queue.append((i,j))
                visited1[i][j] = true
                area1 += 1
                
                while !queue.isEmpty { // BFS
                    let (x,y) = queue.removeFirst()
                    let color = arr[x][y]
                    
                    for k in 0..<4 {
                        let nx = x + dx[k]
                        let ny = y + dy[k]
                        
                        if nx >= 0 && nx < N && ny >= 0 && ny < N {
                            if !visited1[nx][ny] && arr[nx][ny] == color {
                                queue.append((nx,ny))
                                visited1[nx][ny] = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    for i in 0..<N { // 적록색약인 사람
        for j in 0..<N {
            if !visited2[i][j] { // 방문하지 않은 곳
                queue.append((i,j))
                visited2[i][j] = true
                area2 += 1
                
                while !queue.isEmpty { // BFS
                    let (x,y) = queue.removeFirst()
                    let color = arr[x][y]
                    
                    for k in 0..<4 {
                        let nx = x + dx[k]
                        let ny = y + dy[k]
                        
                        if nx >= 0 && nx < N && ny >= 0 && ny < N {
                            if !visited2[nx][ny] {
                                // 적록색약 조건
                                if (color == "R" && arr[nx][ny] == "G") || (color == "G" && arr[nx][ny] == "R") || arr[nx][ny] == color {
                                    queue.append((nx,ny))
                                    visited2[nx][ny] = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    print("\(area1) \(area2)")
}

solution()
