//
//  main.swift
//  BJ7576
//
//  Created by 안홍범 on 10/8/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (M,N) = (input[0],input[1])

var arr = (0..<N).map{ _ in
    readLine()!.split(separator: " ")
        .map{Int($0)!}
}

// 1: 익은 토마토, 0: 익지 않은 토마토, -1: 토마토가 들어있지 않은 칸
// 하루가 지나면 익은 토마토는 인접한 안익은 토마토를 익힐 수 있음, 단 대각선은 인접한 것이 아니다

func solution() {
    var queue = [(Int,Int)]()
    var front = 0
    var day = -1
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    // 익은 토마토의 위치를 큐에 넣음
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] == 1 {
                queue.append((i,j))
            }
        }
    }
    
    while front < queue.count {
        let (x,y) = queue[front]
        front += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= N || ny < 0 || ny >= M {
                continue
            }
            
            if arr[nx][ny] == 0 {
                arr[nx][ny] = arr[x][y] + 1
                queue.append((nx,ny))
            }
        }
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if arr[i][j] == 0 {
                print(-1)
                return
            }
            day = max(day, arr[i][j])
        }
    }
    
    print(day - 1)
}

solution()
