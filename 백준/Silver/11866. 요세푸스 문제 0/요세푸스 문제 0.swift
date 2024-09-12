//
//  main.swift
//  BJ11866
//
//  Created by 안홍범 on 9/12/24.
//

import Foundation

let input = readLine()!
    .split(separator:" ")
    .map{Int($0)!}

var result = [Int]()
var index = 0
var arr = Array(1...input[0])

for _ in 0..<input[0]{
    index = (index+input[1]-1)%arr.count
    result.append(arr.remove(at: index))
}

print("<", terminator: "")
for i in 0..<result.count-1{
    print("\(result[i]), ", terminator: "")
}
print("\(result[result.count-1])>", terminator: "")
