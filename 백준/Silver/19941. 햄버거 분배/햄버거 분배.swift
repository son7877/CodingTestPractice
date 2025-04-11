import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N, K) = (input[0], input[1])
let arr = readLine()!
    .map{Character(String($0))}

func solution(_ K: Int, _ arr: [Character]) -> Int {
    var answer = 0
    var arr = arr
    for i in 0..<arr.count {
        if arr[i] == "P" {
            for i in max(i - K, 0)...min(i + K, arr.count - 1) {
                if arr[i] == "H" {
                    arr[i] = "0"
                    answer += 1
                    break
                }
            }
        }
    }
    
    return answer
}

print(solution(K, arr))
