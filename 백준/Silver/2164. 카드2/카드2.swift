//
//  main.swift
//  BJ2164
//
//  Created by 안홍범 on 9/7/24.
//

import Foundation

let n = Int(readLine()!)!

var queue = Array(1...n)
var front = 0

while queue.count - front > 1 {
    front += 1
    if queue.count - front > 0 {
        queue.append(queue[front])
        front += 1
    }
}

print(queue[front])
