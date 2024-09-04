//
//  main.swift
//  BJ30802
//
//  Created by 안홍범 on 9/4/24.
//

import Foundation

let number = Int(readLine()!)!

let shirtsPerSize = readLine()!.split(separator: " ").map{Int($0)!}

let shirtsAndPens = readLine()!.split(separator: " ").map{Int($0)!}

let shirts = shirtsAndPens[0]
let pens  = shirtsAndPens[1]

var shirtsCount = 0

for i in shirtsPerSize.indices {
    shirtsCount += shirtsPerSize[i] / shirts
    if shirtsPerSize[i] % shirts != 0 {
        shirtsCount += 1
    }
}

print(shirtsCount)
print("\(number/pens) \(number%pens)")


