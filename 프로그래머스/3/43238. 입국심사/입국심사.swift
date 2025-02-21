import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int {
    var timesSorted = times.sorted()
    var answer = 0
    var left = 1
    var right = timesSorted.last! * n
    
    while left <= right {
        let mid = (left + right) / 2
        var sum = 0
        
        for i in 0..<timesSorted.count {
            sum += mid / times[i]
        }
        
        if sum >= n {
            answer = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return answer
}