//
//  main.swift
//  BJ6588
//
//  Created by 안홍범 on 12/3/24.
//
// 시간 초과 이유: 소수 판별 함수를 테스트 케이스 마다 실행시켜서 불필요한 반복이 일어남으로 추측

import Foundation

var prime = [Bool](repeating: true, count: 1000001)

func isPrime() {
    prime[0] = false
    prime[1] = false
    
    for i in 2...1000000 {
        if prime[i] {
            for j in stride(from: i * 2, through: 1000000, by: i) { // i의 배수는 소수가 아니므로
                prime[j] = false
            }
        }
    }
}

func solution(_ input: Int) {
    for i in 3...input {
        if prime[i] && prime[input-i] { // 소수이면서 두 수의 합이 input인 경우
            print("\(input) = \(i) + \(input-i)")
            return
        }
    }
    
    print("Goldbach's conjecture is wrong.")
}

isPrime()

while true {
    let input = Int(readLine()!)
    if input == 0 {
        break
    }
    
    solution(input!)
}
