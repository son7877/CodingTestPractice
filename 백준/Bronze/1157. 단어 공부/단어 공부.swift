//
//  main.swift
//  BJ1157
//
//  Created by 안홍범 on 10/3/24.
//

import Foundation

let input = readLine()!.uppercased()

func solution() {
    var dict = [Character:Int]()
    var max = 0
    var result = ""
    
    for i in input {
        dict[i, default: 0] += 1
    }
    
    for (key,value) in dict {
        if value > max {
            max = value
            result = String(key)
        } else if value == max {
            result = "?"
        }
    }
    
    print(result)
}

solution()
