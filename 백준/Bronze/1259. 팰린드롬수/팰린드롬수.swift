//
//  main.swift
//  BJ1259
//
//  Created by 안홍범 on 11/20/24.
//

import Foundation

while true {
    let input = readLine()!
        .map{Int(String($0))!}

    if input[0] == 0 {
        break
    }
    
    for i in 0..<input.count {
        if input[i] != input[input.count-1-i] {
            print("no")
            break
        }
        
        if i == input.count-1 {
            print("yes")
        }
    }
}
