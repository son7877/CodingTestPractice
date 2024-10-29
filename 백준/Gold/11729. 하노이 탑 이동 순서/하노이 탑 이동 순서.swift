//
//  main.swift
//  BJ11729
//
//  Created by 안홍범 on 10/29/24.
//

import Foundation

let N = Int(readLine()!)!

func solution() {
    var count = 0
    var result = ""

    func hanoi(_ n: Int, _ from: Int, _ by: Int, _ to: Int) {
        if n == 1 {
            count += 1
            result += "\(from) \(to)\n"
            return
        }

        hanoi(n-1, from, to, by)
        count += 1
        result += "\(from) \(to)\n"
        hanoi(n-1, by, from, to)
    }

    hanoi(N, 1, 2, 3)

    print(count)
    print(result)
}

solution()
