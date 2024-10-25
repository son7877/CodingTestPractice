//
//  main.swift
//  BJ16928
//
//  Created by 안홍범 on 10/25/24.
//
// 1차시도: dp로 접근 -> 실패
// 2차시도: bfs로 접근

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (ladders, snakes) = (input[0], input[1])

let ladder = (1...ladders).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

let snake = (1...snakes).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    // bfs로 접근
    var queue = [(Int, Int)]() // (위치, 이동 거리)
    var visited = Array(repeating: false, count: 101) // 방문 여부
    var dist = Array(repeating: 0, count: 101) // 주사위를 굴린 횟수
    var ladderOrSnake = Array(repeating: 0, count: 101) // 사다리나 뱀이 있는 곳
    
    for i in 0..<ladders { // 사다리
        ladderOrSnake[ladder[i][0]] = ladder[i][1]
    }
    
    for i in 0..<snakes { // 뱀
        ladderOrSnake[snake[i][0]] = snake[i][1]
    }
    
    // 시작점
    queue.append((1,0))
    visited[1] = true
    
    // bfs
    while !queue.isEmpty {
        let (x, d) = queue.removeFirst() // x: 위치, d: 주사위를 굴린 횟수
        
        for i in 1...6 {
            var nx = x + i
            var nd = d + 1
            
            if nx <= 100 {
                if ladderOrSnake[nx] != 0 { // 사다리나 뱀이 있는 경우
                    nx = ladderOrSnake[nx]
                    nd = dist[x] + 1
                }
                
                if !visited[nx] { // 방문하지 않은 곳
                    visited[nx] = true
                    dist[nx] = nd
                    queue.append((nx, nd))
                }
            }
        }
    }
    
    print(dist[100])
}

solution()
