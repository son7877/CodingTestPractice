//
//  main.swift
//  BJ2751
//
//  Created by 안홍범 on 9/4/24.
//

import Foundation

let length = Int(readLine()!)!
var arr = [Int]()

for _ in 0..<length {
    arr.append(Int(readLine()!)!)
}

arr.sort()

for i in 0..<length {
    print(arr[i])
}

