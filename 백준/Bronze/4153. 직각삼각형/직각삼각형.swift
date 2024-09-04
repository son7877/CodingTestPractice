//
//  main.swift
//  BJ4153
//
//  Created by 안홍범 on 9/4/24.
//

import Foundation

while true {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    if input[0] == 0 && input[1] == 0 && input[2] == 0 {
        break
    }
    
    let sortedSides = input.sorted()
    let a = sortedSides[0]
    let b = sortedSides[1]
    let c = sortedSides[2]
    
    if a * a + b * b == c * c {
        print("right")
    } else {
        print("wrong")
    }
}
