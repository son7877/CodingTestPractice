//
//  main.swift
//  BJ1874
//
//  Created by 안홍범 on 10/28/24.
//

import Foundation

let n = Int(readLine()!)!

func solution() {
    var stack = [Int]()
    var result = [String]()
    var count = 1
    
    for _ in 0..<n {
        let input = Int(readLine()!)!
        
        while count <= input {
            stack.append(count)
            count += 1
            result.append("+")
        }
        
        if stack.last! == input {
            stack.removeLast()
            result.append("-")
        } else {
            print("NO")
            return
        }
    }
    
    print(result.joined(separator: "\n"))
}

solution()
