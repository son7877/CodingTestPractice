//
//  main.swift
//  BJ2166
//
//  Created by 안홍범 on 2/5/25.
//

import Foundation

let N = Int(readLine()!)! // 꼭지점 개수

var points = [(Double, Double)]()

for _ in 0..<N {
    let input = readLine()!
        .split(separator: " ")
        .map{Double($0)!}
    
    points.append((input[0], input[1]))
}

func solution() {
    // 접근 : 다각형의 넓이를 구하는 공식을 이용한다.
    // 다각형의 넓이 = (x1y2 + x2y3 + ... + xn-1yn + xny1 - (y1x2 + y2x3 + ... + yn-1xn + ynx1)) / 2
    
    var sum1 = 0.0
    var sum2 = 0.0
    
    for i in 0..<N-1 {
        sum1 += points[i].0 * points[i+1].1
        sum2 += points[i].1 * points[i+1].0
    }
    
    sum1 += points[N-1].0 * points[0].1
    sum2 += points[N-1].1 * points[0].0
    
    let result = abs(sum1 - sum2) / 2
    print(String(format: "%.1f", result))
}

solution()
