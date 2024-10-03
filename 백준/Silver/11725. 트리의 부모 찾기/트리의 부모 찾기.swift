//
//  main.swift
//  BJ11725
//
//  Created by 안홍범 on 10/3/24.
//

import Foundation

let N = Int(readLine()!)!

var tree = [[Int]](repeating: [], count: N+1)

for _ in 0..<N-1 {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    tree[input[0]].append(input[1])
    tree[input[1]].append(input[0])
}

func bfs() {
    var queue = [1] // 시작점
    var visited = [Bool](repeating: false, count: N+1)
    var parent = [Int](repeating: 0, count: N+1)
    
    visited[1] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for i in tree[node] {
            if !visited[i] {
                visited[i] = true
                parent[i] = node
                queue.append(i)
            }
        }
    }
    
    for i in 2...N {
        print(parent[i])
    }
}

bfs()
