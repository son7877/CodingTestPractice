//
//  main.swift
//  BJ14425
//
//  Created by 안홍범 on 1/16/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1])

var arr = [String]()
var test = [String]()

for _ in 0..<N {
    arr.append(readLine()!)
}

for _ in 0..<M {
    test.append(readLine()!)
}

func solution() {
    var set = Set<String>()
    var answer = 0
    
    for i in 0..<N {
        set.insert(arr[i])
    }
    
    for i in 0..<M {
        if set.contains(test[i]) {
            answer += 1
        }
    }
    
    print(answer)
}

solution()

