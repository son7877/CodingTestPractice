//
//  main.swift
//  BJ11403
//
//  Created by 안홍범 on 10/18/24.
//

import Foundation

let N = Int(readLine()!)!

let arr = (0..<N).map{_ in
    readLine()!
        .split(separator: " ")
        .map{Int($0)!}
}

func solution() {
    var graph = Array(repeating: Array(repeating: 0, count: N), count: N)

    for i in 0..<N {
        for j in 0..<N {
            graph[i][j] = arr[i][j]
        }
    }

    for k in 0..<N {
        for i in 0..<N {
            for j in 0..<N {
                if graph[i][k] == 1 && graph[k][j] == 1 {
                    graph[i][j] = 1
                }
            }
        }
    }

    for i in 0..<N {
        print(graph[i].map{String($0)}.joined(separator: " "))
    }
}

solution()
