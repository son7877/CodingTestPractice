//
//  main.swift
//  BJ1436
//
//  Created by 안홍범 on 12/26/24.
//

import Foundation

let N = Int(readLine()!)!

solution2(N)

func solution(_ : Int) {
    var count = 0
    var num = 666
    
    while true {
        if String(num).contains("666") { // Int -> String -> contains로 인한 시간초과?
            count += 1
            
            if count == N {
                print(num)
                return
            }
        }
        
        num += 1
    }
}

func solution2(_ : Int) {
    // 문자열로 변환하지 말고 숫자로만 해결해보자
    var count = 0
    var num = 666
    
    while true {
        if isContain666(num) {
            count += 1
            
            if count == N {
                print(num)
                return
            }
        }
        
        num += 1
    }
    
    func isContain666(_ num: Int) -> Bool {
        var count = 0
        var temp = num
        
        while temp != 0 {
            if temp % 10 == 6 {
                count += 1
            } else {
                count = 0
            }
            
            if count == 3 {
                return true
            }
            
            temp /= 10
        }
        
        return false
    }
}
