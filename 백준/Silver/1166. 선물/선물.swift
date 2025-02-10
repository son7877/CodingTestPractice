//
//  main.swift
//  BJ1166
//
//  Created by 안홍범 on 2/10/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, L, W, H) = (input[0], input[1], input[2], input[3])

func solution() {
    var start = 0.0
    var end = Double(min(L, W, H))
    var result = 0.0
    
    for _ in 0..<10000 {
        let mid = (start + end) / 2
        let cnt = Int(floor(Double(L) / mid) * floor(Double(W) / mid) * floor(Double(H) / mid))
        
        if cnt >= N {
            start = mid
            result = mid
        } else {
            end = mid
        }
    }
    
    print(result)
}

solution()
