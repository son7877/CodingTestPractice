//
//  main.swift
//  BJ2565
//
//  Created by 안홍범 on 11/6/24.
//

import Foundation

let N = Int(readLine()!)!

let wire = (1...N).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    let sortedWire = wire.sorted(by: { $0[0] < $1[0] })
    var dp = [Int](repeating: 1, count: N)

    for i in 0..<N {
        for j in 0..<i {
            if sortedWire[i][1] > sortedWire[j][1] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }

    print(N - dp.max()!)
}

solution()
