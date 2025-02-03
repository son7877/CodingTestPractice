//
//  main.swift
//  BJ1107
//
//  Created by 안홍범 on 2/3/25.
//

import Foundation

let N = Int(readLine()!)! // 이동하려는 채널
let crashed = Int(readLine()!)!


func solution() {
    // 고장난 버튼을 제외한 버튼으로 조합된 채널 중 N과 가장 가까운 채널을 찾는다.
    // 그 번호로 버튼을 누르고 횟수 저장
    // +, - 버튼을 이용해서 N에 도달하는 횟수를 계산한다.
    // +, - 버튼으로만 이동하는 횟수와 비교해서 작은 값을 출력한다.
    
    if crashed != 0 {
        let crashedButtons = readLine()!
            .split(separator: " ")
            .map{Int($0)!}
        
        if crashedButtons.count == 10 {
            print(abs(N - 100))
            return
        }
        
        let result1 = abs(N - 100)
        var result2 = 0
        
        for i in 0...1000000 {
            if isPossible(i) {
                let result = abs(N - i) + String(i).count
                if result2 == 0 || result2 > result {
                    result2 = result
                }
            }
        }
        
        func isPossible(_ num: Int) -> Bool {
            if num == 0 {
                return !crashedButtons.contains(0) // 0이 고장났으면 false
            }
            
            var num = num
            while num > 0 {
                if crashedButtons.contains(num % 10) {
                    return false
                }
                num /= 10
            }
            return true
        }
        
        print(min(result1, result2))
    } else { // 고장난 버튼이 없는 경우
        print(min(abs(N - 100), String(N).count))
    }
}

solution()
