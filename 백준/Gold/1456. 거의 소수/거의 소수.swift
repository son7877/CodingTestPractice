//
//  main.swift
//  BJ1456
//
//  Created by 안홍범 on 11/17/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{ Int($0)! }

let (A, B) = (input[0], input[1])

// 거의 소수 : 소수의 제곱으로 나타낼 수 있는 수
// ex) 4, 9, 25 ...
func solution() {
    let max = Int(sqrt(Double(B)))
    var isPrime = Array(repeating: true, count: max+1)
    var prime = [Int]()
    
    for i in 2...max {
        if isPrime[i] {
            prime.append(i)
            var j = i * i
            while j <= max {
                isPrime[j] = false
                j += i
            }
        }
    }
    
    var count = 0
    for p in prime {
        var i = 2
        while pow(Double(p), Double(i)) <= Double(B) {
            if pow(Double(p), Double(i)) >= Double(A) {
                count += 1
            }
            i += 1
        }
    }
    
    print(count)
}

solution()

