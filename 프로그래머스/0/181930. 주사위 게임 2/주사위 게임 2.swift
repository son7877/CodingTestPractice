import Foundation

func solution(_ a:Int, _ b:Int, _ c:Int) -> Int {
    var answer = 0
    let sum1 = a + b + c
    let sum2 = a*a + b*b + c*c
    let sum3 = a*a*a + b*b*b + c*c*c
    
    if (a == b) && (a == c) {
        answer = sum1 * sum2 * sum3
    } else if (a == b) || (b == c) || (a == c) {
        answer = sum1 * sum2
    } else {
        answer = sum1
    }
    
    return answer
}