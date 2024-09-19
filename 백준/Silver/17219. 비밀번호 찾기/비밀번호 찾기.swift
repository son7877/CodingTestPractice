//
//  main.swift
//  BJ17219
//
//  Created by 안홍범 on 9/19/24.
//
//  딕셔너리 이용

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{(Int($0)!)}

var dict = [String: String]()

for _ in 0..<input[0]{
    let siteAndPassword = readLine()!
        .split(separator: " ")
        .map{String($0)}
    
    dict[siteAndPassword[0]] = siteAndPassword[1]
}

for _ in 0..<input[1] {
    let search = readLine()!
    print(dict[search]!)
}

