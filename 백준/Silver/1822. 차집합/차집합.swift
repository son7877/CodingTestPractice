//
//  main.swift
//  BJ1822
//
//  Created by 안홍범 on 3/28/25.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (A, B) = (input[0], input[1])
let Aset = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let Bset = Set(readLine()!
    .split(separator: " ")
    .map{Int($0)!})

func solution(_ Aset: [Int], _ Bset: Set<Int>) {
    var answer = [Int]()
    for i in 0..<Aset.count {
        if Bset.contains(Aset[i]) {
            continue
        }
        answer.append(Aset[i])
    }
    answer.sort()
    
    if answer.isEmpty {
        print(0)
        return
    }
    
    print(answer.count)
    print(answer.map(String.init).joined(separator: " "))
}

solution(Aset, Bset)
