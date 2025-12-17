import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    let counts = tangerine.reduce(into: [:]) 
    { counts, number in 
        counts[number, default: 0] += 1
    }
     
    let sortedCounts = counts.values.sorted(by: >)
        
    var currentCount = 0 
    var answer = 0       
    
    for count in sortedCounts {
        currentCount += count
        answer += 1
        
        if currentCount >= k {
            break
        }
    }
    
    return answer                                   
                                            
}