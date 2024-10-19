//
//  main.swift
//  BJ1058
//
//  Created by 안홍범 on 10/18/24.
//

import Foundation

let N = Int(readLine()!)!
var friends = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
var result = 0

for i in 0..<N {
    let input = readLine()!
        .map {String($0)}
    for j in 0..<N {
        friends[i][j] = input[j] == "Y" ? 1 : 0 // 친구일 경우 1, 아닐 경우 0
    }
}

func solution() {
    for i in 0..<N {
        var count = 0
        for j in 0..<N {
            if i == j { continue }
            if friends[i][j] == 1 {
                count += 1
            } else {
                for k in 0..<N {
                    if friends[i][k] == 1 && friends[j][k] == 1 {
                        count += 1
                        break
                    }
                }
            }
        }
        result = max(result, count)
    }

    print(result)
}

solution()
