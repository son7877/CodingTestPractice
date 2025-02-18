//
//  main.swift
//  BJ13335
//
//  Created by 안홍범 on 2/18/25.
//

import Foundation

let input1 = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let (n, w, L) = (input1[0], input1[1], input1[2])
let trucks = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution() {
    var q = [Int](repeating: 0, count: w)
    var time = 0
    var idx = 0
    var sum = 0

    while idx < n {
        time += 1
        sum -= q[0]
        q.removeFirst()

        if sum + trucks[idx] <= L {
            q.append(trucks[idx])
            sum += trucks[idx]
            idx += 1
        } else {
            q.append(0)
        }
    }

    print(time + w)
}

solution()

