//
//  main.swift
//  BJ1934
//
//  Created by 안홍범 on 11/22/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (a, b) = (input[0], input[1])
    
    func gcd(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return gcd(b, a % b)
    }
    
    print(a * b / gcd(a, b))
}
