//
//  main.swift
//  BJ11437
//
//  Created by 안홍범 on 1/24/25.
//

import Foundation

let N = Int(readLine()!)!

var arr = [[Int]]()

for _ in 0..<N-1 { // 노드 입력
    arr.append(readLine()!
        .split(separator: " ")
        .map { Int($0)! }
    )
}

var tree = Array(repeating: [Int](), count: N + 1)
var parent = Array(repeating: 0, count: N + 1)
var depth = Array(repeating: 0, count: N + 1)
var visited = Array(repeating: false, count: N + 1)

setTree()

let M = Int(readLine()!)!

for _ in 0..<M {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (a, b) = (input[0], input[1])
    
    LCA(pointA: a, pointB: b)
}

func setTree() {
    for i in 0..<N-1 {
        let (a, b) = (arr[i][0], arr[i][1])
        tree[a].append(b)
        tree[b].append(a)
    }
    
    var queue = [1] // 루트는 문제에서 1번으로 고정
    visited[1] = true
    depth[1] = 0
    var front = 0
    
    while front < queue.count {
        let current = queue[front]
        front += 1
        
        for i in 0..<tree[current].count {
            let next = tree[current][i]
            
            if !visited[next] {
                queue.append(next)
                visited[next] = true
                parent[next] = current
                depth[next] = depth[current] + 1
            }
        }
    }
}

func LCA(pointA: Int, pointB: Int) {
    var (a, b) = (pointA, pointB)
    
    while depth[a] != depth[b] {
        if depth[a] > depth[b] {
            a = parent[a]
        } else {
            b = parent[b]
        }
    }
    
    while a != b {
        a = parent[a]
        b = parent[b]
    }
    
    print(a)
}