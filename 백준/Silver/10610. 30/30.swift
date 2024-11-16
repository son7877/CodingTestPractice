//
//  main.swift
//  BJ10610
//
//  Created by 안홍범 on 11/16/24.
//

import Foundation

let N = readLine()!

func solution() {
    // N을 자릿수별로 분리
    let N_arr = String(N).map{Int(String($0))!}
    
    var sum = 0
    var zero = 0
    
    for i in 0..<N_arr.count {
        sum += N_arr[i]
        if N_arr[i] == 0 {
            zero += 1
        }
    }
    
    // 30의 배수는 3의 배수이면서 마지막 자리가 0이어야 함
    if sum % 3 == 0 && zero > 0 {
        let result = N_arr.sorted(by: >)
            .map{String($0)}
            .joined()
        print(result)
    } else {
        print(-1)
    }
}

solution()
