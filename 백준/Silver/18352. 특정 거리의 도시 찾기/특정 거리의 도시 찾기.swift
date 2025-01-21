//
//  main.swift
//  BJ18352
//
//  Created by 안홍범 on 11/24/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (N, M, K, X) = (input[0], input[1], input[2], input[3]) // N: 도시 개수, M: 도로 개수, K: 거리 정보, X: 출발 도시 번호
var arr = [[Int]]()

for _ in 0..<M {
    let edge = readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    
    arr.append(edge)
}

func solution() {
    var graph = Array(repeating: [Int](), count: N + 1)
    var visited = Array(repeating: false, count: N + 1) // 방문 여부
    var distance = Array(repeating: -1, count: N + 1) // 거리 정보
    
    for i in 0..<M {
        let (a, b) = (arr[i][0], arr[i][1])
        graph[a].append(b) // 단방향
    }
    
    var queue = [X] // 시작 도시를 큐에 삽입
    visited[X] = true
    distance[X] = 0
    var front = 0 // 큐의 가장 앞쪽을 가리키는 인덱스
    
    while front < queue.count {
        let current = queue[front]
        front += 1
        
        for i in 0..<graph[current].count {
            let next = graph[current][i] // 현재 도시와 연결된 도시
            
            if !visited[next] { // 방문하지 않은 도시라면
                queue.append(next)
                visited[next] = true // 방문 처리
                distance[next] = distance[current] + 1 // 거리 정보 갱신
            }
        }
    }
    
    // 거리가 K인 도시가 존재하는지 확인
    var check = false
    for i in 1...N {
        if distance[i] == K {
            print(i)
            check = true
        }
    }
    
    if !check {
        print(-1)
    }
}

solution()
