//
//  main.swift
//  BJ4779
//
//  Created by 안홍범 on 12/4/24.
//

import Foundation

while let input = readLine(), let N = Double(input) {
    print(solution(N))
}

func solution(_ N: Double?) -> String {
    // 3의 N승만큼의 길이를 가진 배열 생성
    var arr = [Character](repeating: "-", count: Int(pow(3.0, Double(N!))))
    
    // 재귀함수 호출
    recursive(&arr, 0, arr.count)
    
    return String(arr)
}

func recursive(_ arr: inout [Character], _ start: Int, _ end: Int) {
    // 3의 N승만큼의 길이를 가진 배열을 3등분하여 재귀함수 호출
    let third = (end - start) / 3
    
    // 3등분 후 중간 부분을 공백으로 변경
    if third > 0 {
        for i in start + third..<start + 2 * third {
            arr[i] = " "
        }
        
        recursive(&arr, start, start + third)
        recursive(&arr, start + 2 * third, end)
    }
}
