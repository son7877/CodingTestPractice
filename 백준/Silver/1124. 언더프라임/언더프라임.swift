//
//  main.swift
//  BJ1124
//
//  Created by 안홍범 on 12/9/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }

let (A, B) = (input[0], input[1])

// 에라토스테네스의 체로 소수를 구함
func isPrime(upTo n: Int) -> [Bool] {
    var isPrime = [Bool](repeating: true, count: n + 1)
    isPrime[0] = false
    isPrime[1] = false
    
    for i in 2...Int(Double(n).squareRoot()) {
        if isPrime[i] {
            for multiple in stride(from: i * i, through: n, by: i) {
                isPrime[multiple] = false
            }
        }
    }
    return isPrime
}

// 소인수분해하여 소수의 개수를 계산
func primeCount(_ number: Int, using primes: [Bool]) -> Int {
    var count = 0
    var num = number
    
    for i in 2...number {
        if primes[i] {
            while num % i == 0 {
                count += 1
                num /= i
            }
        }
        if num == 1 { break }
    }
    return count
}

// 언더프라임 계산 함수
func solution() {
    let primes = isPrime(upTo: B)
    
    // 언더프라임 조건 확인
    var result = 0
    for num in A...B {
        let factorCount = primeCount(num, using: primes)
        if factorCount > 0 && primes[factorCount] {
            result += 1
        }
    }
    
    print(result)
}

solution()

