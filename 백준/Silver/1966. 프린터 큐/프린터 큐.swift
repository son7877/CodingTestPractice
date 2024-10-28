//
//  main.swift
//  BJ1966
//
//  Created by 안홍범 on 10/28/24.
//

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    let (n, m) = (input[0], input[1])
    
    let arr = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    
    var queue = [(Int, Int)]()
    
    for i in 0..<n {
        queue.append((i, arr[i]))
    }
    
    var count = 0
    
    while !queue.isEmpty {
        let max = queue.map{$0.1}.max()!
        
        if queue.first!.1 == max { // 가장 큰 값이면
            count += 1
            
            if queue.first!.0 == m { // 찾는 값이면
                break
            }
            
            queue.removeFirst()
        } else {
            queue.append(queue.removeFirst())
        }
    }
    
    print(count)
}
