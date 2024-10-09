//
//  main.swift
//  BJ14940
//
//  Created by 안홍범 on 10/9/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (n,m) = (input[0],input[1])

var map = (0..<n).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}


// 0: 갈 수 없는 곳, 1: 갈 수 있는 곳, 2: 도착점

func solution() {
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    var queue = [(Int,Int)]()
    var front = 0
    
    // 도착점의 위치를 큐에 넣음
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 2 {
                queue.append((i,j))
            }
        }
    }
    
    while front < queue.count {
        let (x,y) = queue[front]
        front += 1
        
        // 상하좌우로 이동
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= n || ny < 0 || ny >= m {
                continue
            }
            
            if map[nx][ny] == 1 {
                map[nx][ny] = map[x][y] + 1
                queue.append((nx,ny))
            }
        }
    }
    
    // 도착점에 도달하지 못한 곳은 -1로 변경
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 {
                map[i][j] = -1
            }
        }
    }
    
    // 출력
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 0 {
                print(0,terminator: " ")
            } else if map[i][j] == -1 {
                print(-1,terminator: " ")
            } else {
                print(map[i][j]-2,terminator: " ")
            }
        }
        print()
    }
}

solution()
