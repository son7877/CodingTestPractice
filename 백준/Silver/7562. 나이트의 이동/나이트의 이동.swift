//
//  main.swift
//  BJ7562
//
//  Created by 안홍범 on 11/5/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let I = Int(readLine()!)!
    
    let start = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let end = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    // 나이트 이동 방향
    let dx = [-2, -1, 1, 2, 2, 1, -1, -2]
    let dy = [1, 2, 2, 1, -1, -2, -2, -1]
    
    var visited = Array(
        repeating:
            Array(repeating: false, count: I),
        count: I
    )
    
    var queue = [(start[0], start[1])] // 시작점
    visited[start[0]][start[1]] = true
    
    var result = 0
    
    while !queue.isEmpty {
        let size = queue.count
        for _ in 0..<size {
            let (x, y) = queue.removeFirst()
            
            if x == end[0] && y == end[1] { // 도착점에 도달하면 종료
                print(result)
                break
            }
            
            for i in 0..<8 {
                let nx = x + dx[i]
                let ny = y + dy[i]

                if nx < 0 || nx >= I || ny < 0 || ny >= I {
                    continue
                }
                
                if !visited[nx][ny] {
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                }
            }
        }
        result += 1
    }
}
