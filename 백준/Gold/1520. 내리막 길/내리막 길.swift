//
//  main.swift
//  BJ1520
//
//  Created by 안홍범 on 12/5/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map {Int($0)!}

let (M, N) = (input[0], input[1])

let map  = (0..<M).map { _ in
    readLine()!
        .split(separator: " ")
        .map {Int($0)!}
}

func solution() {
    var dp = [[Int]](repeating: [Int](repeating: -1, count: N), count: M)
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    func dfs(_ x: Int, _ y: Int) -> Int {
        if x == M - 1 && y == N - 1 {
            return 1
        }
        
        if dp[x][y] != -1 {
            return dp[x][y]
        }
        
        dp[x][y] = 0
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx >= 0 && nx < M && ny >= 0 && ny < N {
                if map[nx][ny] < map[x][y] {
                    dp[x][y] += dfs(nx, ny)
                }
            }
        }
        
        return dp[x][y]
    }
    
    print(dfs(0, 0))
}

solution()
