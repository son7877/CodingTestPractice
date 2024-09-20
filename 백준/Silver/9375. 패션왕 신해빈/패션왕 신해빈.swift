//
//  main.swift
//  BJ9375
//
//  Created by 안홍범 on 9/20/24.
//
// Dictionary를 이용하여 의상의 종류별로 의상의 수를 저장

// 1차 제출 : 런타임 에러
// 원인 추론: n이 0일때 고려하지 않음

import Foundation

let testCase = Int(readLine()!)!

for _ in 1...testCase {
    let clothes = Int(readLine()!)!
    var dic = [String:[String]]()
    
    if clothes == 0 {
        print(0)
        continue
    }
    
    for _ in 1...clothes{
        let input = readLine()!
            .split(separator: " ")
            .map{String($0)}
        let key = input[1]
        let value = input[0]
        dic[key, default:[]].append(value)
    }
    var answer = 1
    for (_, value) in dic {
        answer *= value.count + 1
    }
    print(answer - 1) // 아무것도 입지 않은 경우 즉 공집합 제외
}

