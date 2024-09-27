//
//  main.swift
//  BJ18111
//
//  Created by 안홍범 on 9/27/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{ Int($0)! }

let (N, M, B) = (input[0], input[1], input[2])
var map: [Int] = []
for _ in 0..<N {
    map += readLine()!
        .split(separator: " ")
        .map{ Int($0)! }
}

let have = map.reduce(0, +) + B
func valid(_ height: Int) -> Bool {
    let need = N*M*height
    return need <= have
}

func time(_ height: Int) -> Int {
    var res = 0
    for t in map {
        if t < height {
            res += height - t
        } else if height < t {
            res += 2*(t - height)
        }
    }
    return res
}

var (minTime, result) = (Int(10e10), -1)
for height in 0...256 {
    if valid(height) {
        let t = time(height)
        if minTime >= t {
            minTime = t
            result = height
        }
    }
}

print(minTime, result)
