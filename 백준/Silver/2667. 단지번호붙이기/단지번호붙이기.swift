//
//  main.swift
//  BJ2667
//
//  Created by 안홍범 on 10/19/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = (0..<N).map { _ in
    readLine()!
        .map{Int(String($0))!}
}

func solution() {
    var result = 0
    var count = 0
    
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N) // 방문 여부 배열 생성
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    func dfs(_ x: Int, _ y: Int) {
        visited[x][y] = true // 방문 -> true 처리
        count += 1
        
        for i in 0..<4 {
            // 상하좌우 탐색
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= N || ny < 0 || ny >= N { // 구역의 범위를 벗어날 경우 continue 처리
                continue
            }
            
            if arr[nx][ny] == 1 && !visited[nx][ny] { // 방문하지 않은 집일 경우 dfs 수행
                dfs(nx, ny)
            }
        }
    }
    
    var answer = [Int]() // 단지 내 집의 수를 담을 배열
    
    for i in 0..<N {
        for j in 0..<N {
            if arr[i][j] == 1 && !visited[i][j] { // 방문하지 않은 집일 경우
                count = 0 // 단지 내 집의 수 초기화
                dfs(i, j)
                answer.append(count) // 단지 내 집의 수 추가
            }
        }
    }
    
    print(answer.count) // 단지 수 출력
    
    answer.sort()
    for i in 0..<answer.count {
        print(answer[i]) // 단지 내 집의 수 출력
    }
}

solution()