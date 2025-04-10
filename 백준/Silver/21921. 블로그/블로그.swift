//
//  main.swift
//  BJ21921
//
//  Created by 안홍범 on 3/28/25.
//

import Foundation


let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, X) = (input[0], input[1])
let visitors = readLine()!
    .split(separator: " ")
    .map {Int($0)!}

func solution(_ visitors: [Int], _ X: Int) -> [Int] {
    var answer = [Int]()
    
    var windowSum = visitors[0..<X].reduce(0,+)
    var maxSum = windowSum
    var count = 1
    
    for i in X..<visitors.count {
        windowSum = windowSum - visitors[i-X] + visitors[i]
        if maxSum <= windowSum {
            if maxSum == windowSum {
                count += 1
            } else {
                count = 1
            }
        }
        maxSum = max(maxSum, windowSum)
    }
    
    answer.append(maxSum)
    answer.append(count)
    
    return answer
}

let result = solution(visitors, X)
if result[0] == 0 {
    print("SAD")
} else {
    for i in result {
        print(i)
    }
}
