//
//  main.swift
//  BJ1722
//
//  Created by 안홍범 on 2/1/25.
//

import Foundation

let N = Int(readLine()!)!

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let problem = input[0]

func solution() {
    var factArr = [Int]()
    for i in 0..<N { // 팩토리얼 계산 (경우의 수)
        factArr.append(fact(N - i - 1))
    }
                
    var num = [Int]()
    for i in 0..<N {
        num.append(i + 1)
    }
    
    switch problem {
        case 1: // K번째 순열 찾기
            var K = input[1]
            var result = Array(repeating: 0, count: N)
            var i = 0
            
            while num.count > 0 {
                let factorial = factArr[i]
                let count = (K - 1) / factorial
                
                result[i] = num.remove(at: count)
                K -= count * factorial
                
                i += 1
            }
            
            for i in 0..<N {
                print(result[i], terminator: " ")
            }
                
        case 2: // 순열이 몇 번째인지 찾기
            var arr = [Int]()
            for i in 1...N { // 순열 입력
                arr.append(input[i])
            }
            
            var result = 1 // 초기값 설정
            var i = 0
            
            while num.count > 0 {
                let factorial = factArr[i]
                let count = num.firstIndex(of: arr[i])!
                
                result += count * factorial
                
                num.remove(at: count)
                i += 1
            }
            
            print(result)
            
        default:
            return
    }
}

func fact(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    return n * fact(n - 1)
}

solution()
