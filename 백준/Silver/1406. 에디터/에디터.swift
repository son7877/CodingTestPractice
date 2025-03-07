//
//  main.swift
//  BJ_1406
//
//  Created by 안홍범 on 3/7/25.
//

import Foundation

var words = readLine()!
let N = Int(readLine()!)!

func solution(_ words: String) -> String {
    var left = Array(words)
    var right = [Character]()
    
    for _ in 0..<N {
        let command = readLine()!
        switch command {
            case "L":
                if !left.isEmpty {
                    right.append(left.removeLast())
                }
            case "D":
                if !right.isEmpty {
                    left.append(right.removeLast())
                }
            case "B":
                if !left.isEmpty {
                    left.removeLast()
                }
            default:
                left.append(command.last!)
        }
    }
    
    return String(left + right.reversed())
}
    
print(solution(words))
