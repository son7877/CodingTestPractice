//
//  main.swift
//  BJ1105
//
//  Created by 안홍범 on 12/8/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map { Int($0)! }
let (L, R) = (input[0], input[1])

func solution() {
    var answer = 0

    let LStr = String(L)
    let RStr = String(R)

    if LStr.count != RStr.count {
        print(0)
        return
    }

    for i in 0..<LStr.count {
        let lIndex = LStr.index(LStr.startIndex, offsetBy: i)
        let rIndex = RStr.index(RStr.startIndex, offsetBy: i)

        if LStr[lIndex] == RStr[rIndex], LStr[lIndex] == "8" {
            answer += 1
        } else if LStr[lIndex] != RStr[rIndex] {
            break
        }
    }

    print(answer)
}

solution()
