import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
        
    var leftSum = Array(repeating: 0, count: topping.count)
    var leftSet = Set<Int>()
    
    for i in 0..<topping.count {
        leftSet.insert(topping[i])
        leftSum[i] = leftSet.count
    }
    
    var rightSum = Array(repeating: 0, count: topping.count)
    var rightSet = Set<Int>()
    
    for i in (0..<topping.count).reversed() { 
        rightSet.insert(topping[i])
        rightSum[i] = rightSet.count
    }
    
    for i in (0..<topping.count-1) {
        if leftSum[i] == rightSum[i+1] { 
            answer += 1 
        }
    }
    
    return answer
}