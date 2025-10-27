import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let n64 = Int64(n)
    
    var start: Int64 = 1
    var end: Int64 = Int64(times.max()!) * n64
    var answer: Int64 = end 
    
    while start <= end {
        let mid: Int64 = (start + end) / 2
        
        var total: Int64 = 0 
        for time in times {
            let time64 = Int64(time)
            
            total += mid / time64
            
            if total >= n64 {
                break
            }
        }
        
        if total >= n64 {
            answer = mid
            end = mid - 1 
        } else {
            start = mid + 1  
        }
    }
    
    return answer
}