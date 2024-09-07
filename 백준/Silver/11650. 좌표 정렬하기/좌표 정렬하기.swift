//
//  main.swift
//  BJ11650
//
//  Created by 안홍범 on 9/7/24.
//

import Foundation

let number = Int(readLine()!)!

var arr = [[Int]]()

for _ in 0..<number {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(input)
}

arr.sort { (left, right) -> Bool in
    if left[0] == right[0] {
        return left[1] < right[1]
    } else {
        return left[0] < right[0]
    }
}

for i in arr.indices {
    print("\(arr[i][0]) \(arr[i][1])")
}



