//
//  main.swift
//  BJ5525
//
//  Created by 안홍범 on 10/13/24.
//

import Foundation

let n = Int(readLine()!)!

let length = Int(readLine()!)!
let string = String(readLine()!)

var arr = Array(string) // 문자열을 문자 배열로 변환

func solution() {
    // n=1 IOI
    // n=2 IOIOI 이런 방식
    
    var result = 0
    var count = 0
    
    for i in 0..<length {
        if arr[i] == "I" {
            if i >= 2 && arr[i-2] == "I" && arr[i-1] == "O" {
                count += 1
                if count == n {
                    result += 1
                    count -= 1
                }
            } else {
                count = 0
            }
        }
    }
    
    print(result)
}

solution()
