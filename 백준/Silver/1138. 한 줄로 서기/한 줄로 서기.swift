//
//  main.swift
//  BJ1138
//
//  Created by 안홍범 on 11/27/24.
//

import Foundation

let N = Int(readLine()!)!
let people = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var result = Array(repeating: 0, count: N)
    
    for i in 0..<N {
        var count = people[i]
        for j in 0..<N {
            if count == 0 && result[j] == 0 {
                result[j] = i + 1
                break
            } else if result[j] == 0 {
                count -= 1
            }
        }
    }
    
    for i in 0..<N {
        print(result[i], terminator: " ")
    }
}

solution()
