//
//  main.swift
//  BJ11505
//
//  Created by 안홍범 on 1/20/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M, K) = (input[0], input[1], input[2]) // N: 수의 개수, M: 변경 횟수, K: 구간 곱 횟수

var arr = [Int]()
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

// 트리 구조 설정
let depth = Int(ceil(log2(Double(N)))) // 트리의 높이
let data = Int(pow(2.0, Double(depth))) // 전체 노드 개수
let treeSize = data * 2
var tree = Array(repeating: 0, count: treeSize)

for i in 0..<N {
    tree[data + i] = arr[i]
}

for i in stride(from: data-1, to: 0 , by: -1) {
    tree[i] = (tree[i * 2] * tree[i * 2 + 1]) % 1000000007
}

for _ in 0..<M+K {
    let query = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    if query[0] == 1 {
        updateTree(query)
    } else {
        getMul(query)
    }
}

func updateTree(_ query: [Int]) {
    // 트리의 리프 노드에 값 변경
    tree[data + query[1] - 1] = query[2]
    
    // 부모 노드에 대한 합 갱신
    var index = (data + query[1] - 1) / 2
    while index > 0 {
        tree[index] = (tree[index * 2] * tree[index * 2 + 1]) % 1000000007
        index /= 2
    }
}

func getMul(_ query: [Int]) {
    var left = query[1] + data - 1
    var right = query[2] + data - 1
    
    var result = 1
    while left <= right {
        if left % 2 == 1 {
            result = (result * tree[left]) % 1000000007
            left += 1
        }
        
        if right % 2 == 0 {
            result = (result * tree[right]) % 1000000007
            right -= 1
        }
        
        left /= 2
        right /= 2
    }
    
    print(result)
}
