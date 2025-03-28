//
//  main.swift
//  BJ19637
//
//  Created by 안홍범 on 3/27/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let (titles, characters) = (input[0], input[1])

var stats = [[String]]()
for _ in 0..<titles {
    let input = readLine()!
        .split(separator: " ")
        .map{String($0)}
    
    stats.append([input[0], input[1]])
}

func solution(_ stat: Int) -> String {
    // 이분 탐색
    var left = 0
    var right = titles - 1
    while left < right {
        let mid = (left + right) / 2
        if Int(stats[mid][1])! >= stat {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return stats[left][0]
}

for _ in 0..<characters {
    let stat = Int(readLine()!)!
    print(solution(stat))
}
