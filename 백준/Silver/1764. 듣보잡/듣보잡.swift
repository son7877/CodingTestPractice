//
//  main.swift
//  BJ1764
//
//  Created by 안홍범 on 9/17/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

var arr1 = Set<String>()
var arr2 = Set<String>()

for _ in 0..<input[0]{
    arr1.insert(readLine()!)
}

for _ in 0..<input[1]{
    let name = readLine()!
    if arr1.contains(name){
        arr2.insert(name)
    }
}

print(arr2.count)
for i in arr2.sorted(){
    print(i)
}
