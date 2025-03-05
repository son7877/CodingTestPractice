//
//  main.swift
//  BJ_1263
//
//  Created by 안홍범 on 3/5/25.
//

import Foundation

let N = Int(readLine()!)!
var schedules = [[Int]]()

for _ in 0..<N {
    schedules.append(
        readLine()!
            .split(separator: " ")
            .map{Int($0)!}
    )
}

func solution(_ schedules: [[Int]]) -> Int {
    let schedulesSorted = schedules.sorted(by: {$0[1]>$1[1]})
    var time = schedulesSorted[0][1]
    
    for i in 0..<schedulesSorted.count {
        if time > schedulesSorted[i][1] {
            time = schedulesSorted[i][1]
        }
        
        time -= schedulesSorted[i][0]
        
        if time < 0 {
            return -1
        }
    }
    
    return time
}

print(solution(schedules))
