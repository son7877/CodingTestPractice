//
//  main.swift
//  BJ11724
//
//  Created by 안홍범 on 9/28/24.
//
// 1차 제출 : 런타임 에러
// 추정 원인 : 재귀?
import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let (N,M) = (input[0], input[1])

var graph = [Int: [Int]]()

for _ in 0..<M {
    let edge = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    // 방향 없는 그래프
    graph[edge[0], default: []].append(edge[1])
    graph[edge[1], default: []].append(edge[0])
}

for key in graph.keys {
    graph[key]?.sort() // 연결 요소 정렬
}

var visited = [Bool](repeating: false, count: N+1)

func dfs(_ now: Int) {
    visited[now] = true
    for next in graph[now] ?? [] {
        if !visited[next] {
            dfs(next)
        }
    }
}

var count = 0

// 연결 요소 찾기
for i in 1...N {
    if !visited[i] {
        dfs(i)
        count += 1
    }
}

print(count)



