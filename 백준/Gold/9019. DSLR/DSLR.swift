//
//  main.swift
//  BJ9019
//
//  Created by 안홍범 on 10/25/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (A ,B) = (input[0], input[1])
    solution(A, B)
}

func solution(_ A: Int, _ B: Int) {
    var queue = [(Int, String)]() // (현재 수, 연산)
    var visited = Array(repeating: false, count: 10000)
    var head = 0 // removeFirst()를 사용하지 않기 위해 설정
    
    queue.append((A, "")) // 시작점
    visited[A] = true
    
    while head < queue.count {
        let (x, s) = queue[head]
        head += 1
        
        if x == B {
            print(s)
            return
        }
        
        let nx = (x*2) % 10000 // D 연산
        if !visited[nx] {
            queue.append((nx, s+"D"))
            visited[nx] = true
        }
        
        let ny = (x == 0 ? 9999 : x-1) // S 연산
        if !visited[ny] {
            queue.append((ny, s+"S"))
            visited[ny] = true
        }
        
        let l = x % 1000 * 10 + x / 1000 // L 연산
        if !visited[l] {
            queue.append((l, s+"L"))
            visited[l] = true
        }
        
        let r = x / 10 + x % 10 * 1000 // R 연산
        if !visited[r] {
            queue.append((r, s+"R"))
            visited[r] = true
        }
    }
}
