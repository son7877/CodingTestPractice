//
//  main.swift
//  BJ4948
//
//  Created by 안홍범 on 11/19/24.
//

import Foundation

while true {
    let N = Int(readLine()!)!
    
    if N == 0 {
        break
    }
        
    solution(N)
}

func solution(_ N: Int) {
    // 베르트랑 공준 : n보다 크고 2n보다 작거나 같은 소수는 적어도 하나 존재
    let max = 2 * N
    var isPrime = Array(repeating: true, count: max+1) // 소수 판별 배열
    
    isPrime[0] = false
    isPrime[1] = false
    
    if max == 2 {
        print(1)
        return
    }
    
    for i in 2...Int(sqrt(Double(max))) {
        if isPrime[i] {
            var j = 2
            while i * j <= max {
                isPrime[i * j] = false
                j += 1
            }
        }
    }
    
    // 소수 개수 카운트
    var count = 0
    for i in N+1...max {
        if isPrime[i] {
            count += 1
        }
    }
    
    print(count)
}
