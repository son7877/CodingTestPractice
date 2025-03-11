//
//  main.swift
//  BJ_2531
//
//  Created by 안홍범 on 3/11/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, d, k, c) = (input[0], input[1], input[2], input[3])
var sushi = [Int]()
for _ in 0..<N {
    sushi.append(Int(readLine()!)!)
}

func solution(_ N: Int, _ d: Int, _ k: Int, _ c: Int, _ sushi: [Int]) -> Int {
    var answer = 0
    var count = 0
    var kind = Array(repeating: 0, count: d + 1) // 초밥 종류의 개수
    
    for i in 0..<k { // 초기 가짓 수 설정
        if kind[sushi[i]] == 0 {
            count += 1
        }
        kind[sushi[i]] += 1
    }
    
    answer = count
    if kind[c] == 0 { // 쿠폰 초밥이 없다면 1 추가
        answer += 1
    }
    
    for  i in 0..<N {
        let start = i
        let end = (i + k) % N
        
        kind[sushi[start]] -= 1
        if kind[sushi[start]] == 0 {
            count -= 1
        }
        
        if kind[sushi[end]] == 0 {
            count += 1
        }
        kind[sushi[end]] += 1
        
        if kind[c] == 0 {
            answer = max(answer, count + 1)
        } else {
            answer = max(answer, count)
        }
        
        if answer == k + 1 {
            break
        }
    }
    
    return answer
}

print(solution(N, d, k, c, sushi))
