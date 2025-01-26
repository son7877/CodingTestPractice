//
//  main.swift
//  BJ11438
//
//  Created by 안홍범 on 1/24/25.
//

import Foundation

let N = Int(readLine()!)!

var tree = Array(repeating: [Int](), count: N + 1)
var depth = Array(repeating: 0, count: N + 1)
var visited = Array(repeating: false, count: N + 1)
let maxDepth = Int(log2(Double(N)) + 1)
var parent = Array(repeating: Array(repeating: 0, count: maxDepth), count: N + 1)

// 트리 입력
for _ in 0..<N-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    tree[input[0]].append(input[1])
    tree[input[1]].append(input[0])
}

// 트리 구성 및 깊이 설정
func setTree() {
    var queue = [1]
    visited[1] = true
    depth[1] = 0
    var front = 0
    
    while front < queue.count {
        let current = queue[front]
        front += 1
        
        for next in tree[current] {
            if !visited[next] {
                visited[next] = true
                depth[next] = depth[current] + 1
                parent[next][0] = current // 첫 번째 부모 설정
                queue.append(next)
            }
        }
    }
}

// 부모 정보 미리 계산
func getParent() {
    for j in 1..<maxDepth {
        for i in 1...N {
            parent[i][j] = parent[parent[i][j-1]][j-1]
        }
    }
}

// LCA 계산
func LCA(a: Int, b: Int) -> Int {
    var (a, b) = (a, b)
    
    if depth[a] > depth[b] {
        swap(&a, &b)
    }
    
    for i in stride(from: maxDepth-1, through: 0, by: -1) {
        if depth[b] - depth[a] >= (1 << i) {
            b = parent[b][i]
        }
    }
    
    if a == b {
        return a
    }
    
    for i in stride(from: maxDepth-1, through: 0, by: -1) {
        if parent[a][i] != parent[b][i] {
            a = parent[a][i]
            b = parent[b][i]
        }
    }
    
    return parent[a][0]
}

// 초기화 및 입력 처리
setTree()
getParent()

let M = Int(readLine()!)!
for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    print(LCA(a: input[0], b: input[1]))
}
