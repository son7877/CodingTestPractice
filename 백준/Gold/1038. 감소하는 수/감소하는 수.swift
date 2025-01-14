//
//  main.swift
//  BJ1038
//
//  Created by 안홍범 on 1/13/25.
//

import Foundation

let N = Int(readLine()!)!

solution(N: N)

func solution(N: Int) {
    // 큐를 사용하여 감소하는 수를 생성
    var queue = [Int]()
    
    // 0부터 9까지 초기 숫자를 큐에 삽입
    for i in 0...9 {
        queue.append(i)
    }
    
    var count = -1 // 감소하는 수의 순서를 기록
    
    while !queue.isEmpty {
        let current = queue.removeFirst() // 큐에서 숫자를 꺼냄
        count += 1
        
        // N번째 감소하는 수를 찾은 경우 출력 후 종료
        if count == N {
            print(current)
            return
        }
        
        // 현재 숫자의 마지막 자릿수를 구함
        let lastDigit = current % 10
        
        // 마지막 자릿수보다 작은 숫자를 뒤에 붙여 새로운 감소하는 수 생성
        for nextDigit in 0..<lastDigit {
            queue.append(current * 10 + nextDigit)
        }
    }
    
    // 큐가 비었는데도 N번째 감소하는 수를 찾지 못한 경우
    print(-1)
}
