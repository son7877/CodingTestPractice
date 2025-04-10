//
//  main.swift
//  BJ1515
//
//  Created by 안홍범 on 4/10/25.
//

import Foundation

let input = readLine()!

func solution(_ input: String) -> Int {
    var currentIndex = 0
    var num = 1
    let inputArray = Array(input)

    while currentIndex < inputArray.count {
        let numStr = String(num)
        
        for char in numStr {
            if char == inputArray[currentIndex] {
                currentIndex += 1
                if currentIndex >= inputArray.count {
                    return num
                }
            }
        }
        
        num += 1
    }
    
    return num
}

print(solution(input))
