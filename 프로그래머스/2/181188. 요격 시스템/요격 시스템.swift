import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var answer = 0
    let sorted = targets.sorted(by: { $0[1] < $1[1] })    
    
    var end = sorted[0][1]

    for target in sorted { 
        if target[0] >= end {
            end = target[1]
            answer += 1
        }
    }
    
    return answer + 1
}