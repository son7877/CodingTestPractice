import Foundation

let N = Int(readLine()!)!

// N은 1부터 100까지
func solution() {
    if N == 1 {
        print(9)
        return
    }

    var dp = Array(repeating: Array(repeating: 0, count: 10), count: N+1) // dp[i][j]: i자리 수에서 j로 끝나는 계단 수의 개수
    
    for i in 1...9 {
        dp[1][i] = 1
    }
    
    for i in 2...N {
        for j in 0...9 {
            if j == 0 {
                dp[i][j] = dp[i-1][j+1] % 1000000000
            } else if j == 9 {
                dp[i][j] = dp[i-1][j-1] % 1000000000
            } else {
                dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
            }
        }
    }
    
    print(dp[N].reduce(0, +) % 1000000000)
}

solution()
