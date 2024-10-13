//
//  main.swift
//  BJ2096
//
//  Created by 안홍범 on 10/12/24.
//

import Foundation

let N = Int(readLine()!)!

let numbers = (0..<N).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution(){
    var dpMax = numbers[0]
    var dpMin = numbers[0]
    
    for i in 0..<N {
        if i == 0 {
            continue
        }
        
        let a = dpMax[0]
        let b = dpMax[1]
        let c = dpMax[2]
        
        let d = dpMin[0]
        let e = dpMin[1]
        let f = dpMin[2]
        
        // 인접한 인덱스 끼리 값 비교
        dpMax[0] = max(a, b) + numbers[i][0]
        dpMax[1] = max(a, b, c) + numbers[i][1]
        dpMax[2] = max(b, c) + numbers[i][2]
        
        dpMin[0] = min(d, e) + numbers[i][0]
        dpMin[1] = min(d, e, f) + numbers[i][1]
        dpMin[2] = min(e, f) + numbers[i][2]
    }
    
    print(dpMax.max()!, terminator: " ")
    print(dpMin.min()!)
}

solution()
