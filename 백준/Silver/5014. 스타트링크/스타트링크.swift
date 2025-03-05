//
//  main.swift
//  BJ_5014
//
//  Created by 안홍범 on 3/5/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (F,S,G,U,D) = (input[0], input[1], input[2], input[3], input[4])

func solution(_ F: Int, _ S: Int, _ G:Int, _ U: Int, _ D: Int) -> String {
    var answer = -1
    
    var visited = Array(repeating: false, count: F+1)
    var queue = [(S,0)]
    visited[S] = true // 시작 지점
    var header = 0
    
    while header < queue.count {
        let (current, count) = queue[header]
        header += 1
        
        if current == G {
            answer = count
            break
        }
        
        if current + U <= F && !visited[current + U] { // 위로 올라가는 경우
            visited[current + U] = true
            queue.append((current + U, count + 1))
        }
        
        if current - D > 0 && !visited[current - D] { // 아래로 내려가는 경우
            visited[current - D] = true
            queue.append((current - D, count + 1))
        }
    }
    
    return answer == -1 ? "use the stairs" : String(answer)
}

print(solution(F, S, G, U, D))
