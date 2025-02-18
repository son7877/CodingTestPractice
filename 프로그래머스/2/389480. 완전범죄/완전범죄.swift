import Foundation

func solution(_ info: [[Int]], _ n: Int, _ m: Int) -> Int {
    let size = info.count
    var dp = Array(repeating: Array(repeating: 100000, count: m), count: size + 1)
    
    dp[0][0] = 0
    
    for i in 1...size {
        let a = info[i - 1][0]
        let b = info[i - 1][1]
        
        for j in 0..<m {
            // a 선택
            dp[i][j] = min(dp[i][j], dp[i - 1][j] + a)
            
            // b 선택
            if j + b < m {
                dp[i][j + b] = min(dp[i][j + b], dp[i - 1][j])
            }
        }
    }
    
    var minValue = 100000
    for j in 0..<m {
        minValue = min(dp[size][j], minValue)
    }
    
    return minValue >= n ? -1 : minValue
}