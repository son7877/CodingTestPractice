//
//  main.swift
//  BJ1253
//
//  Created by 안홍범 on 11/12/24.
//

import Foundation

let N = Int(readLine()!)!
let N_arr = readLine()!
    .split(separator: " ")
    .map{Int($0)!}
    .sorted()

func solution() {
    var count = 0
    
    for i in 0..<N {
        var left = 0
        var right = N - 1
        
        while left < right {
            if left == i {  // i번째 수 제외
                left += 1
            } else if right == i {  // i번째 수 제외
                right -= 1
            } else {
                let sum = N_arr[left] + N_arr[right]
                if sum == N_arr[i] {  // 좋은 수 발견
                    count += 1
                    break
                } else if sum < N_arr[i] {  // 합이 작으면 left 증가
                    left += 1
                } else {  // 합이 크면 right 감소
                    right -= 1
                }
            }
        }
    }
    
    print(count)
}

solution()
