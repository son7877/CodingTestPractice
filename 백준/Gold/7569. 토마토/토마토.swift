//
//  main.swift
//  BJ7569
//
//  Created by 안홍범 on 10/23/24.
//
// 전에 풀었던 토마토 문제에서 3차원으로 확장

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (M,N,H) = (input[0], input[1], input[2])

var arr = (0..<H).map{ _ in
    (0..<N).map{ _ in
        readLine()!
            .split(separator: " ")
            .map{Int($0)!}
    }
}

func solution() {
    var queue = [(Int, Int, Int)]()
    var day = -1
    var front = 0
    let dx = [-1,1,0,0,0,0]
    let dy = [0,0,-1,1,0,0]
    let dz = [0,0,0,0,-1,1]
    
    // 익은 토마토를 찾아 큐에 넣기
    for z in 0..<H {
        for y in 0..<N {
            for x in 0..<M {
                if arr[z][y][x] == 1 {
                    queue.append((z,y,x))
                }
            }
        }
    }
    
    // 시간복잡도 고려하여 removeFirst() 지양하기
    while front < queue.count {
        let (z,y,x) = queue[front]
        front += 1
        
        for i in 0..<6 {
            let nz = z + dz[i]
            let ny = y + dy[i]
            let nx = x + dx[i]
            
            if nz >= 0 && nz < H && ny >= 0 && ny < N && nx >= 0 && nx < M {
                if arr[nz][ny][nx] == 0 {
                    arr[nz][ny][nx] = arr[z][y][x] + 1
                    queue.append((nz,ny,nx))
                }
            }
        }
    }
    
    // 안익은 토마토가 있는지 확인
    for i in 0..<H {
        for j in 0..<N {
            for k in 0..<M {
                if arr[i][j][k] == 0 {
                    print(-1)
                    return
                }
                day = max(day, arr[i][j][k])
            }
        }
    }
    
    print(day-1)
}

solution()
