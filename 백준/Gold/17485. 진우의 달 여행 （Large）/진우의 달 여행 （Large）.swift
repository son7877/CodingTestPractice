import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, M) = (input[0], input[1]) // 가로 M , 세로 N
var arr = [[Int]]()

for _ in 0..<N {
    arr.append(readLine()!.split(separator: " ").map{Int($0)!})
}

func solution(_ arr: [[Int]]) -> Int {
    var answer = Int.max
    var dp = Array(
                repeating: 
                    Array(
                        repeating: [Int](repeating: Int.max, count: 3),
                        count: M
                    ),
                count: N
            )

    for j in 0..<M {
        dp[0][j][0] = arr[0][j]
        dp[0][j][1] = arr[0][j]
        dp[0][j][2] = arr[0][j]
    }

    for i in 1..<N {
        for j in 0..<M {
            if j + 1 < M {
                dp[i][j][0] = min(dp[i - 1][j + 1][1], dp[i - 1][j + 1][2]) + arr[i][j]
            }

            dp[i][j][1] = min(dp[i-1][j][0], dp[i-1][j][2]) + arr[i][j]

            if j - 1 >= 0 {
                dp[i][j][2] = min(dp[i - 1][j - 1][0], dp[i-1][j - 1][1]) + arr[i][j]
            } 
        }

        for j in 0..<M {
            for k in 0..<3 {
                answer = min(answer, dp[N - 1][j][k])
            } 
        }
    }
    

    return answer 
}

print(solution(arr))