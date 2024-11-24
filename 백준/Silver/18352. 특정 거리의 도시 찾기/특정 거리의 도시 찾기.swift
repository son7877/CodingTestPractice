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

let (N, M, K, X) = (input[0], input[1], input[2], input[3])

func solution() {
    var graph = Array(repeating: [Int](), count: N + 1) // 단방향 연결 그래프
    
    for _ in 0..<M {
        let link = readLine()!
            .split(separator: " ")
            .map { Int($0)! }
        graph[link[0]].append(link[1]) // 단방향 연결
    }
    
    var distances = Array(repeating: -1, count: N + 1) // 거리 배열 (-1로 초기화)
    var result = [Int]() // 결과 배열
    
    func bfs(_ start: Int) {
        var queue = [(start, 0)] // (노드, 거리) 형태로 저장
        var front = 0
        distances[start] = 0 // 시작점의 거리는 0
        
        while front < queue.count {
            let (node, dist) = queue[front]
            front += 1
            
            if dist == K {
                result.append(node)
            }
            
            for nextNode in graph[node] {
                if distances[nextNode] == -1 {
                    distances[nextNode] = dist + 1
                    queue.append((nextNode, dist + 1))
                }
            }
        }
    }
    
    bfs(X)
    
    if result.isEmpty {
        print(-1)
    } else {
        result.sort() // 결과를 오름차순으로 정렬
        result.forEach { print($0) }
    }
}

solution()
