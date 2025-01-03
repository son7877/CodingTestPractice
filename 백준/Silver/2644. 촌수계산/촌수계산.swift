//
//  main.swift
//  BJ2644
//
//  Created by 안홍범 on 1/3/25.
//

import Foundation

let n = Int(readLine()!)!

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (p1, p2) = (input[0], input[1])

let relationships = Int(readLine()!)!

var relation = [[Int]](repeating: [Int](), count: n+1)

for _ in 0..<relationships {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (a, b) = (input[0], input[1])
    
    relation[a].append(b)
    relation[b].append(a)
}

func solution() {
    var visited = [Bool](repeating: false, count: n+1)
    var result = -1
    
    func dfs(_ start: Int, _ end: Int, _ depth: Int) {
        if start == end {
            result = depth
            return
        }
        
        visited[start] = true
        
        for i in relation[start] {
            if !visited[i] {
                dfs(i, end, depth+1)
            }
        }
    }
    
    dfs(p1, p2, 0)
    
    print(result)
}

solution()
