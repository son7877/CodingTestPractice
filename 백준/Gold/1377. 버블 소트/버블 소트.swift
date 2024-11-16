//
//  main.swift
//  BJ1377
//
//  Created by 안홍범 on 11/15/24.
//

import Foundation

let N = Int(readLine()!)!
var N_arr = Array(repeating: 0, count: N)
for i in 0..<N {
    N_arr[i] = Int(readLine()!)!
}

func solution() {
    var result = 0
    var N_arr = N_arr.enumerated().map{($0, $1)} // (index, value)
    N_arr.sort{ $0.1 < $1.1 }
    
    for i in 0..<N {
        result = max(result, N_arr[i].0 - i)
    }
    
    print(result + 1)
}


solution()
