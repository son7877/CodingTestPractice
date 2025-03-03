//
//  main.swift
//  BJ_1713
//
//  Created by 안홍범 on 3/3/25.
//

import Foundation

let N = Int(readLine()!)!
let votes = Int(readLine()!)!
let students = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

func solution(_ N: Int, _ votes: Int, _ students: [Int]) -> [Int] {
    var answer : [(student: Int, votes: Int, time: Int)] = []
    
    for (time, student) in students.enumerated() {
        if let index = answer.firstIndex(where: {
            $0.student == student
        }) {
            answer[index].votes += 1
        } else if answer.count < N {
            answer.append((student,1,time))
        } else {
            let minVotes = answer.min(by: {$0.votes < $1.votes})!.votes
            let candidates = answer.filter {$0.votes == minVotes}
            
            let latest = candidates.min(by: {$0.time < $1.time})!
            
            if let removeIndex = answer.firstIndex(where: { $0.student == latest.student }) {
                answer.remove(at: removeIndex)
            }
            
            answer.append((student,1,time))
        }
    }

    return answer.map{$0.student}.sorted()
}

print(solution(N, votes, students).map{String($0)}.joined(separator: " "))

