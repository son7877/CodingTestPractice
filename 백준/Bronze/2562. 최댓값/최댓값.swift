//
//  main.swift
//  BJ2562
//
//  Created by 안홍범 on 9/4/24.
//

import Foundation

var arr = [Int]()

for _ in 0..<9 {
    arr.append(Int(readLine()!)!)
}

print(arr.max()!)
print(arr.firstIndex(of: arr.max()!)! + 1)

