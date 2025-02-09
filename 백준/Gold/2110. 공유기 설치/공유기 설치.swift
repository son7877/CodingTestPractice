//
//  main.swift
//  BJ2110
//
//  Created by 안홍범 on 2/9/25.
//

import Foundation

let input = readLine()!
    .split(separator:" ")
    .map{Int($0)!}

let (N, C) = (input[0], input[1])
var houses = [Int]()
for _ in 0..<N {
    houses.append(Int(readLine()!)!)
}

func solution() {
    let sortedHouses = houses.sorted()
    var start = 1
    var end = sortedHouses[N-1] - sortedHouses[0]
    var result = 0
    
    while start <= end {
        let mid = (start + end) / 2
        var value = sortedHouses[0]
        var cnt = 1
        
        for i in 1..<N {
            if sortedHouses[i] >= value + mid {
                value = sortedHouses[i]
                cnt += 1
            }
        }
        
        if cnt >= C {
            start = mid + 1
            result = mid
        } else {
            end = mid - 1
        }
    }
    
    print(result)
}

solution()
