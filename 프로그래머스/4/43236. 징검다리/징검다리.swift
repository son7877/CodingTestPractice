import Foundation

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    let sortedRocks = rocks.sorted()
    
    let allPoints = [0] + sortedRocks + [distance]
    
    var start = 1
    var end = distance
    var answer = 0
    
    while start <= end {
        let mid = (start + end) / 2
        
        var removedCount = 0
        var lastPos = 0
        
        for i in 1..<allPoints.count {
            let currentPos = allPoints[i]
            
            let gap = currentPos - lastPos
            
            if gap < mid {
                removedCount += 1
            } else {
                lastPos = currentPos
            }
        }
        
        if removedCount <= n {
            answer = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return answer
}