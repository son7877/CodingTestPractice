//
//  main.swift
//  BJ18110
//
//  Created by 안홍범 on 12/26/24.
//

import Foundation

let n = Int(readLine()!)!

if n == 0 {
    print(0)
    exit(0)
}

var arr = [Int]()

for _ in 1...n {
    arr.append(Int(readLine()!)!)
}

solution(arr: arr, n: n)

func solution(arr: [Int], n: Int) {
    let k = Double(n) * 0.15
    let roundK = Int(round(k))
    
    // 배열 정렬
    let sortedArr = arr.sorted()
    
    // 작은 k개와 큰 k개를 제외한 배열
    let trimmedArr = sortedArr[roundK..<(n - roundK)]
    
    // 평균 계산
    let sum = trimmedArr.reduce(0, +)
    let result = Int(round(Double(sum) / Double(trimmedArr.count)))
    
    print(result)
}



