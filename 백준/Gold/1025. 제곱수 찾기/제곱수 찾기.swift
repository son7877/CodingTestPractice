//
//  main.swift
//  BJ1025
//
//  Created by 안홍범 on 1/7/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map {Int($0)!}

let (N, M) = (input[0], input[1])

let arr = (0..<N).map { _ in
    readLine()!.map {Int(String($0))!}
}

func solution() {
    var result = -1  

    for i in 0..<N {
        for j in 0..<M {
            
            for dx in -N..<N {
                for dy in -M..<M {
                    if dx == 0 && dy == 0 {
                        continue
                    }

                    var x = i
                    var y = j
                    var num = 0

                    while x >= 0 && x < N && y >= 0 && y < M {
                        num = num * 10 + arr[x][y]

                        if isSquare(num) {
                            result = max(result, num)
                        }

                        x += dx
                        y += dy
                    }
                }
            }
        }
    }

    print(result)
}

func isSquare(_ num: Int) -> Bool {
    let sqrtNum = Int(sqrt(Double(num)))
    return sqrtNum * sqrtNum == num
}

solution()
