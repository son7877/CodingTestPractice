//
//  main.swift
//  BJ1697
//
//  Created by 안홍범 on 9/29/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{(Int($0)!)}

let(start, end) = (input[0], input[1])
var visited = [Bool](repeating: false, count: 100001)

// 3가지 경우의 수
// x-1, x+1, 2*x

func bfs(x: Int) -> Int {
    var queue = [x]
    visited[x] = true
    var count = 0
    
    while !queue.isEmpty {
        let size = queue.count
        for _ in 0..<size{
            let now = queue.removeFirst()
            
            if now == end {
                return count
            }
            
            if now - 1 >= 0 && !visited[now - 1] {
                visited[now - 1] = true
                queue.append(now - 1)
            }
            
            if now + 1 <= 100000 && !visited[now + 1] {
                visited[now + 1] = true
                queue.append(now + 1)
            }
            
            if now * 2 <= 100000 && !visited[now * 2] {
                visited[now * 2] = true
                queue.append(now * 2)
            }
        }
        count += 1
    }
    return count
}

print(bfs(x: start))
