//
//  main.swift
//  BJ1389
//
//  Created by 안홍범 on 10/15/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (people, relationships) = (input[0], input[1])

func solution() {
    // 플로이드 워셜 알고리즘
    var graph = Array(repeating: Array(repeating: 10000000, count: people), count: people)

    for i in 0..<people {
        graph[i][i] = 0
    }

    for _ in 0..<relationships {
        let input = readLine()!
            .split(separator: " ")
            .map{Int($0)!}
        
        let (a,b) = (input[0]-1, input[1]-1)
        
        graph[a][b] = 1
        graph[b][a] = 1
    }
    
    for k in 0..<people {
        for i in 0..<people {
            for j in 0..<people {
                graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
            }
        }
    }
    
    var result = 0
    var min = 10000000
    
    for i in 0..<people {
        var sum = 0
        for j in 0..<people {
            sum += graph[i][j]
        }
        
        if sum < min {
            min = sum
            result = i
        }
    }
    
    print(result+1)
}

solution()
