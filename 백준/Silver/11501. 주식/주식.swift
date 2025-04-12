import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let N = Int(readLine()!)!
    let prices = readLine()!.split(separator: " ").map{Int($0)!}
    print(solution(N, prices))
}

func solution(_ N: Int, _ prices: [Int]) -> Int {
    var sum = 0
    let future = Array(prices.reversed())
    var target = future[0]
    for i in 1..<future.count {
        if target - future[i] > 0 {
            sum += target - future[i]
        } else {
            target = future[i]
        }
    }

    return sum
}
