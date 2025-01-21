//
//  main.swift
//  BJ1325
//
//  Created by 안홍범 on 1/21/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map {Int($0)!}

let (N, M) = (input[0], input[1]) // N: 컴퓨터 개수, M: 신뢰 관계 개수

var arr = [[Int]]()

for _ in 0..<M {
    let edge = readLine()!
        .split(separator: " ")
        .map {Int($0)!}
    
    arr.append(edge)
}

func solution() {
    var graph = Array(repeating: [Int](), count: N + 1)
    var answer = Array(repeating: 0, count: N + 1) // 신뢰할 수 있는 컴퓨터 개수
    
    for i in 0..<M {
        let (a,b) = (arr[i][0], arr[i][1])
        graph[a].append(b) // 단방향
    }
    
    for i in 1...N {
        var visited = Array(repeating: false, count: N + 1) // 방문 여부
        var queue = [i]
        visited[i] = true
        var front = 0
        
        while front < queue.count {
            let current = queue[front]
            front += 1
            
            for i in 0..<graph[current].count {
                let next = graph[current][i]
                
                if !visited[next] {
                    queue.append(next)
                    visited[next] = true
                    answer[next] += 1
                }
            }
        }
    }
    
    let max = answer.max()!
    
    for i in 1...N {
        if answer[i] == max {
            print(i, terminator: " ")
        }
    }
}

solution()

