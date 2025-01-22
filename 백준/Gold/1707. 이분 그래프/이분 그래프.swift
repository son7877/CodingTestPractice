//
//  main.swift
//  BJ1707
//
//  Created by 안홍범 on 1/21/25.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    let (V, E) = (input[0], input[1]) // V: 노드 개수, E: 에지 개수
    
    solution(V: V, E: E)
}

func solution(V: Int, E: Int) {
    var graph = Array(repeating: [Int](), count: V + 1)
    
    for _ in 0..<E {
        let edge = readLine()!
            .split(separator: " ")
            .map{Int($0)!}
        
        let (a, b) = (edge[0], edge[1])
        graph[a].append(b)
        graph[b].append(a)
    }
    
    // 이분 그래프인지 확인
    var visited = Array(repeating: 0, count: V + 1)
    var isBipartite = true
    
    for i in 1...V {
        if visited[i] == 0 {
            if !bfs(graph: graph, visited: &visited, start: i) {
                isBipartite = false
                break
            }
        }
    }
    
    func bfs(graph: [[Int]], visited: inout [Int], start: Int) -> Bool {
        var queue = [start]
        visited[start] = 1
        var front = 0
        
        while front < queue.count {
            let node = queue[front]
            front += 1
            
            for next in graph[node] {
                if visited[next] == 0 {
                    visited[next] = visited[node] == 1 ? 2 : 1 // 1: A, 2: B
                    queue.append(next)
                } else {
                    if visited[next] == visited[node] { // 같은 그룹이면 이분 그래프가 아님
                        return false
                    }
                }
            }
        }
        
        return true
    }
    
    print(isBipartite ? "YES" : "NO")
}
