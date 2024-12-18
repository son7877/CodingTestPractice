//
//  main.swift
//  BJ9009
//
//  Created by 안홍범 on 12/18/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let T = Int(readLine()!)!
    
    solution(T : T)
}

func solution(T : Int) {
    var fibo = [Int]()
    
    fibo.append(0)
    fibo.append(1)
    
    var i = 2
    
    while true {
        fibo.append(fibo[i-1] + fibo[i-2])
        
        if fibo[i] > T {
            break
        }
        
        i += 1
    }
    
    var result = [Int]()
    var sum = T
    
    for j in stride(from: i-1, through: 1, by: -1) {
        if sum >= fibo[j] {
            result.append(fibo[j])
            sum -= fibo[j]
        }
    }

    for j in stride(from: result.count-1, through: 0, by: -1) {
        print(result[j], terminator: " ")
    }
}


