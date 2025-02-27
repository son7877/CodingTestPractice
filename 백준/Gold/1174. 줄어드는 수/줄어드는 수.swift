//
//  main.swift
//  BJ_1174
//  줄어드는 수
//
//  Created by 안홍범 on 2/27/25.
//

import Foundation

var N = Int(readLine()!)!

func solution(_ N: Int) -> Int {
    var arr = [Int]()
    
    func decreasingNumbers(_ current: Int, _ lastDigit: Int) {
        arr.append(current)
        
        for i in 0..<lastDigit {
            decreasingNumbers(current * 10 + i, i)
        }
    }
    
    for i in 0...9 {
        decreasingNumbers(i, i)
    }
    
    arr.sort()
    
    return N <= arr.count ? arr[N - 1] : -1
}

print(solution(N))
