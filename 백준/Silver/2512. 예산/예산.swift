//
//  main.swift
//  BJ2512
//
//  Created by 안홍범 on 3/28/25.
//

import Foundation

let N = Int(readLine()!)!
let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
let M = Int(readLine()!)!

func solution (_ N: Int, _ input: [Int], _ M:Int) -> Int {
    /*
        이분 탐색
        1. left, right, mid 설정
        2. mid를 기준으로 예산을 계산
        3. 예산이 M보다 작거나 같으면 left를 mid + 1로 설정
        4. 예산이 M보다 크면 right를 mid - 1로 설정
        5. left가 right보다 커지면 종료
     */
    var answer = 0
    var left = 0
    var right = input.max()!
    
    while left <= right {
        let mid = (left + right) / 2
        var sum = 0
        for i in 0..<N {
            sum += min(input[i], mid)
        }
        
        if sum <= M {
            left = mid + 1
            answer = mid
        } else {
            right = mid - 1
        }
    }
    
    return answer
}

print(solution(N, input, M))