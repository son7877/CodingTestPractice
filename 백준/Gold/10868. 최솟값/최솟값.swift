//
//  main.swift
//  BJ10868
//
//  Created by 안홍범 on 1/20/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1]) // N: 수의 개수, M: 구간의 개수

var arr = [Int]()
for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

// 트리의 구조 설정
let depth = Int(ceil(log2(Double(N)))) // 트리의 높이
let data = Int(pow(2.0, Double(depth))) // 전체 노드 개수
let treeSize = data * 2
var tree = Array(repeating: 0, count: treeSize)

// 리프 노드 초기화
for i in 0..<N {
    tree[data + i] = arr[i]
}

// 리프 노드의 부모 노드 값(두 자식 노드 중 작은 값) 구하기
for i in stride(from: data - 1, to: 0, by: -1) {
    tree[i] = min(tree[i * 2], tree[i * 2 + 1])
}

for _ in 0..<M {
    let scope = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    print(solution(scope: scope))
}

func solution(scope: [Int]) -> Int {
    // 구간의 최소값 구하기
    var result = Int.max
    var left = scope[0] + data - 1
    var right = scope[1] + data - 1
    
    while left <= right {
        if left % 2 == 1 {
            result = min(result, tree[left])
            left += 1
        }
        
        if right % 2 == 0 {
            result = min(result, tree[right])
            right -= 1
        }
        
        left /= 2
        right /= 2
    }
    
    return result
}
