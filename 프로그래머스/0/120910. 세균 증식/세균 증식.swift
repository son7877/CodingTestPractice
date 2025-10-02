import Foundation

func solution(_ n:Int, _ t:Int) -> Int {
    var answer = n
    
    for i in 1...t {
        answer *= 2
    }
    
    return answer
}