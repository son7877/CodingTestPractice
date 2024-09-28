//
//  main.swift
//  BJ1260
//
//  Created by 안홍범 on 9/28/24.
//
// 첫 줄: DFS
// 둘째 줄: BFS

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{ Int($0)! }

let (N, M, start) = (input[0], input[1], input[2])

var graph = [Int: [Int]]()

func addEdge(_ from: Int, _ to: Int) {
    // 양방향 그래프
    graph[from, default: []].append(to)
    graph[to, default: []].append(from)
}

for _ in 0..<M {
    let edge = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    addEdge(edge[0], edge[1])
}

// 인접 리스트 정렬 --> 1차 실패 원인
for key in graph.keys {
    graph[key]?.sort()
}

// stack을 이용한 DFS
func dfs(_ graph: [Int: [Int]], _ start: Int) -> [Int] {
    var visited = [Int]()
    var stack = [start]
    
    while !stack.isEmpty {
        let node = stack.removeLast()
        if !visited.contains(node) {
            visited.append(node)
            stack += graph[node, default: []].reversed()
        }
    }
    
    return visited
}

// queue를 이용한 BFS
func bfs(_ graph: [Int: [Int]], _ start: Int) -> [Int] {
    var visited = [Int]()
    var queue = [start]
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        if !visited.contains(node) {
            visited.append(node)
            queue += graph[node, default: []]
        }
    }
    
    return visited
}

// DFS 탐색 결과 출력
print(dfs(graph, start).map{String($0)}.joined(separator: " "))

// BFS 탐색 결과 출력
print(bfs(graph, start).map{String($0)}.joined(separator: " "))
