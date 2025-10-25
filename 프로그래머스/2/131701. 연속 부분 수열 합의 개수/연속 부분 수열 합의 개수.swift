import Foundation

func solution(_ elements:[Int]) -> Int {
    let n = elements.count
    var allSum = Set<Int>()
    
    for start in 0..<n {
        var currentSum = 0
        for length in 1...n {
            let currentIndex = (start + length - 1) % n
            currentSum += elements[currentIndex]
            
            allSum.insert(currentSum)
        }
    }
    
    return allSum.count
}