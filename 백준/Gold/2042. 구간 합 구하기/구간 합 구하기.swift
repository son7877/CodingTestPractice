//
//  main.swift
//  BJ2042
//
//  Created by 안홍범 on 1/17/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M, K) = (input[0], input[1], input[2])

var arr = [Int]()

for _ in 0..<N {
    arr.append(Int(readLine()!)!)
}

func solution() {
    // 트리의 구조 설정
    let depth = Int(ceil(log2(Double(N))))
    let data = Int(pow(2.0, Double(depth)))
    let treeSize = data * 2
    var tree = Array(repeating: 0, count: treeSize)

    
    // 리프 노드 초기화
    for i in 0..<N {
        tree[data + i] = arr[i]
    }
    
    // 리프 노드의 부모 노드에 대한 합 구하기
    for i in stride(from: data - 1, to: 0, by: -1) {
        tree[i] = tree[i * 2] + tree[i * 2 + 1]
    }
        
    for _ in 0..<M+K {
        let query = readLine()!
            .split(separator: " ")
            .map{Int($0)!}
        
        if query[0] == 1 {
            updateTree(query)
        } else {
            getSum(query)
        }
    }

    func updateTree(_ query: [Int]) {
        // 트리의 리프 노드에 값 변경
        tree[data + query[1] - 1] = query[2]
        
        // 부모 노드에 대한 합 갱신
        var index = (data + query[1] - 1) / 2
        while index > 0 {
            tree[index] = tree[index * 2] + tree[index * 2 + 1]
            index /= 2
        }
    }

    func getSum(_  query: [Int]) {
        // 구간 합 구하기
        var result = 0
        
        var left = query[1] - 1 + data
        var right = query[2] - 1 + data
        
        while left <= right {
            if left % 2 == 1 {
                result += tree[left]
                left += 1
            }
            if right % 2 == 0 {
                result += tree[right]
                right -= 1
            }
            left /= 2
            right /= 2
        }
        
        print(result)
    }
}

solution()


