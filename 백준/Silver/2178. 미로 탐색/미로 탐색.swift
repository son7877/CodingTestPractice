//
//  main.swift
//  BJ2178
//
//  Created by 안홍범 on 10/26/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])
var arr = (1...N).map{_ in
    readLine()!
        .map{String($0)}
}

func solution() {
    var queue = [(Int, Int)]()
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    var visited = Array(
        repeating:
            Array(repeating: false, count: M),
        count: N
    )
    
    queue.append((0,0))
    visited[0][0] = true
    
    while !queue.isEmpty {
        let (x,y) = queue.removeFirst()
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && nx < N && ny >= 0 && ny < M {
                if !visited[nx][ny] && arr[nx][ny] == "1" {
                    queue.append((nx,ny))
                    visited[nx][ny] = true
                    arr[nx][ny] = String(Int(arr[x][y])! + 1)
                }
            }
        }
    }
    
    print(Int(arr[N-1][M-1])!)
}

solution()
