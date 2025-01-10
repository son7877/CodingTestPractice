//
//  main.swift
//  BJ22353
//
//  Created by 안홍범 on 1/10/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Double($0)! }

let a = input[0] // 끝말잇기 시간
var d = input[1] / 100 // 승률
let k = input[2] / 100 // 졌을 때 승률 증가량

var expectedValue = 0.0
var prevLoseProbability = 1.0
var i = 0

while true {
    i += 1
    expectedValue += a * prevLoseProbability * d * Double(i)
    
    if d >= 1 {
        break
    }
    
    // 다음 판을 위한 값 갱신
    prevLoseProbability *= (1 - d) // 이번 판까지 모두 질 확률
    d += d * k // 다음 판의 승률 증가
        
    if d >= 1 {
        d = 1
    }
}

print(String(format: "%.7f", expectedValue))
