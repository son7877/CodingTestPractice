//
//  main.swift
//  BJ1068
//
//  Created by 안홍범 on 11/4/24.
//

import Foundation

let N = Int(readLine()!)!

let nodes = readLine()!
    .split(separator: " ")
    .map {Int($0)!}

let deleteNumber = Int(readLine()!)!

func solution() {
    // 인접 리스트
    var root = 0
    var tree = [[Int]](repeating: [], count: N)
    var visited = [Bool](repeating: false, count: N)
    var answer = 0

    // 트리 구성
    for i in 0..<N {
        if nodes[i] != -1 {
            tree[nodes[i]].append(i)
        } else {
            root = i
        }
    }

    // 루트 노드가 삭제된 경우
    if root == deleteNumber {
        print(0)
        return
    }

    // 삭제된 노드와의 연결 제거
    func removeNode(_ node: Int) {
        visited[node] = true
        for child in tree[node] {
            if !visited[child] {
                removeNode(child)
            }
        }
        tree[node] = [] // 삭제된 노드의 자식 관계 제거
    }

    removeNode(deleteNumber)

    // DFS로 리프 노드 개수 계산
    func DFS(_ node: Int) {
        visited[node] = true
        var isLeaf = true

        for child in tree[node] {
            if !visited[child] {
                isLeaf = false
                DFS(child)
            }
        }

        if isLeaf {
            answer += 1
        }
    }

    DFS(root)
    print(answer)
}

solution()

