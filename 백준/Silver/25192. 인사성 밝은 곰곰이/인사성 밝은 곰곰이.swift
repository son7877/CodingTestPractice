//
//  main.swift
//  BJ25192
//
//  Created by 안홍범 on 12/27/24.
//

import Foundation

let N = Int(readLine()!)!

func solution() {
    var set = Set<String>()
    var result = 0
    
    for _ in 1...N {
        let input = readLine()!
        
        if input == "ENTER" {
            result += set.count
            set = []
        } else {
            set.insert(input)
        }
    }
    
    print(result+set.count)
}

solution()
