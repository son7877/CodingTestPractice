//
//  main.swift
//  BJ1931
//
//  Created by 안홍범 on 9/29/24.
//

import Foundation

let number = Int(readLine()!)!
var meetings = [(Int, Int)]()
for _ in 0..<number{
    let input = readLine()!
        .split(separator: " ")
        .map{Int($0)!}
    meetings.append((input[0], input[1]))
}

// 정렬 방법: 끝나는 시간을 기준으로 오름차순 정렬, 끝나는 시간이 같다면 시작하는 시간을 기준으로 오름차순 정렬
meetings.sort(by: {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1
    }
})

// 끝나는 시간이 가장 빠른 회의를 선택
func choice (meetings: [(Int, Int)]) -> Int {
    var count = 0
    var endTime = 0
    for meeting in meetings {
        if meeting.0 >= endTime {
            count += 1
            endTime = meeting.1
        }
    }
    return count
}

print(choice(meetings: meetings))