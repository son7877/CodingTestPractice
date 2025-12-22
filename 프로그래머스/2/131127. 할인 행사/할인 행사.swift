import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var answer = 0
    var dict = [String:Int]()
    
    for i in 0..<want.count {
        dict[want[i]] = number[i]
    }
    
    for i in 0...(discount.count - 10) {
        var currentDiscountDict = [String: Int]()
        
        for j in i..<i+10 {
            let item = discount[j]
            currentDiscountDict[item, default: 0] += 1
        }
        
        if isMatch(dict, currentDiscountDict) {
            answer += 1
        }
    }
    
    return answer
}

func isMatch(_ target: [String:Int], _ current: [String: Int]) -> Bool {
    for (item, count) in target {
        if current[item] != count {
            return false
        }
    }
    
    return true
}