import Foundation

func combinations<T>(_ array: [T], _ k: Int) -> [[T]] {
    guard k > 0 else { return [[]] }
    guard let first = array.first else { return [] }
    
    let subArray = Array(array.dropFirst())
    let withFirst = combinations(subArray, k - 1).map { [first] + $0 }
    let withoutFirst = combinations(subArray, k)
    
    return withFirst + withoutFirst
}

func solution(_ n: Int, _ q: [[Int]], _ ans: [Int]) -> Int {
    let possibleCode = combinations(Array(1...n), 5)
    var totalCnt = 0
    
    for code in possibleCode {
        var makeCode = true
        for i in 0..<q.count {
            let intersectionCount = Set(code).intersection(Set(q[i])).count
            if intersectionCount != ans[i] {
                makeCode = false
                break
            }
        }
        
        if makeCode {
            totalCnt += 1
        }
    }
    
    return totalCnt
}
