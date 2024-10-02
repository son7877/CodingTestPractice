//
//  main.swift
//  BJ15666
//
//  Created by 안홍범 on 10/2/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let N_arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
    .sorted()

var result = [Int]()
var check = Set<String>()

func solution() {
    if result.count == input[1] {
        let str = result.map{String($0)}.joined(separator: " ")
        if !check.contains(str) {
            check.insert(str)
            print(str)
        }
        return
    }
    
    for i in N_arr {
        if result.isEmpty || result.last! <= i {
            result.append(i)
            solution()
            result.removeLast()
        }
    }
}

solution()
