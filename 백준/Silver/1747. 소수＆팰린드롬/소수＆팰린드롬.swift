//
//  main.swift
//  BJ1747
//
//  Created by 안홍범 on 11/20/24.
//

import Foundation

let N = Int(readLine()!)!

func solution() {
    // N보다 크거나 같고, 소수이면서 팰린드롬인 수 중에서 가장 작은 수 찾기
    var num = N
    
    while true {
        if isPrime(num) && isPalindrome(num) {
            print(num)
            break
        }
        
        num += 1
    }
}

func isPrime(_ num: Int) -> Bool {
    if num == 1 {
        return false
    }
    
    for i in 2..<Int(sqrt(Double(num)))+1 {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

func isPalindrome(_ num: Int) -> Bool {
    let str = String(num)
    let reversedStr = String(str.reversed())
    
    return str == reversedStr
}

solution()

