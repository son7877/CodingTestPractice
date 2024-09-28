//
//  main.swift
//  BJ1012
//
//  Created by 안홍범 on 9/28/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    let (length, height, cabbage) = (input[0], input[1], input[2])
    
    // 배추 좌표 입력
    var map = Array(repeating: Array(repeating: 0, count: length), count: height)
    for _ in 0..<cabbage {
        let cabbage = readLine()!
            .split(separator: " ")
            .map{Int($0)!}
        map[cabbage[1]][cabbage[0]] = 1
    }
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    // 깊이 우선 탐색
    func dfs(_ x: Int, _ y: Int) {
        map[x][y] = 0

        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]

            if nx < 0 || nx >= height || ny < 0 || ny >= length {
                continue
            }

            if map[nx][ny] == 1 {
                dfs(nx, ny)
            }
        }
    }
    
    var count = 0
    for i in 0..<height {
        for j in 0..<length {
            if map[i][j] == 1 {
                dfs(i, j)
                count += 1
            }
        }
    }
    print(count)

}




