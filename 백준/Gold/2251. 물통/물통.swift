//
//  main.swift
//  BJ2251
//
//  Created by 안홍범 on 1/22/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map({Int($0)!})

let (A, B, C) = (input[0], input[1], input[2])

func solution(A: Int, B: Int, C: Int) {
    var visited = Array(repeating: Array(repeating: false, count: 201), count: 201)
    var result = Array(repeating: false, count: 201)
    var answer = [Int]()
    
    func dfs(_ a: Int, _ b: Int, _ c: Int) {
        if visited[a][b] {
            return
        }
        
        if a == 0 {
            result[c] = true
        }
        
        visited[a][b] = true
        
        if a + b > B {
            dfs(a + b - B, B, c)
        } else {
            dfs(0, a + b, c)
        }
        
        if a + c > C {
            dfs(a + c - C, b, C)
        } else {
            dfs(0, b, a + c)
        }
        
        if b + a > A {
            dfs(A, b + a - A, c)
        } else {
            dfs(b + a, 0, c)
        }
        
        if b + c > C {
            dfs(a, b + c - C, C)
        } else {
            dfs(a, 0, b + c)
        }
        
        if c + a > A {
            dfs(A, b, c + a - A)
        } else {
            dfs(c + a, b, 0)
        }
        
        if c + b > B {
            dfs(a, B, c + b - B)
        } else {
            dfs(a, c + b, 0)
        }
    }
    
    dfs(0, 0, C)
    
    for i in 0...C {
        if result[i] {
            answer.append(i)
        }
    }
    
    print(answer.map({String($0)}).joined(separator: " "))
}

solution(A: A, B: B, C: C)
