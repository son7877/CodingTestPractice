//
//  main.swift
//  BJ16943
//
//  Created by 안홍범 on 12/22/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map({Int(String($0))!})

let (A, B) = (input[0], input[1])

func solution() {
    let digits = Array(String(A)) // A의 자릿수를 배열로 변환
    var visited = Array(repeating: false, count: digits.count)
    var maxNumber = -1 // B보다 작으면서 가장 큰 수를 저장할 변수
    
    func dfs(current: String) {
        // 현재 조합이 완성되었을 때
        if current.count == digits.count {
            let number = Int(current)!
            if number < B { // B보다 작으면 갱신
                maxNumber = max(maxNumber, number)
            }
            return
        }
        
        for i in 0..<digits.count {
            if visited[i] { continue } // 이미 사용된 숫자는 건너뜀
            
            // 첫 자리가 0인 경우 스킵 (유효하지 않은 숫자)
            if current.isEmpty && digits[i] == "0" { continue }
            
            visited[i] = true
            dfs(current: current + String(digits[i]))
            visited[i] = false
        }
    }
    
    dfs(current: "")
    print(maxNumber)
}

solution()

