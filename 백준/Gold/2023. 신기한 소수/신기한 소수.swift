//
//  main.swift
//  BJ2023
//
//  Created by 안홍범 on 10/18/24.
//

import Foundation

let number = Int(readLine()!)! // 자릿수 -> 그래프의 깊이

func isPrime(_ num: Int) -> Bool { // 소수 판별 함수
    if num < 2 {
        return false
    }
    
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

func dfs(_ num: Int, _ depth: Int) {
    if depth == number { // 깊이가 자릿수와 같아지면 출력
        print(num)
        return
    }
    
    for i in 1...9 {
        let next = num * 10 + i // 다음 자릿수
        
        if isPrime(next) {
            dfs(next, depth+1)
        }
    }
}

func solution() { // 2,3,5,7로 시작하는 소수 각각 찾기
    dfs(2, 1)
    dfs(3, 1)
    dfs(5, 1)
    dfs(7, 1)
}

solution()