//
//  main.swift
//  BJ11047
//
//  Created by 안홍범 on 9/18/24.
//
// 필요한 동전 개수의 최소값 구하기

import Foundation

var input = readLine()?
    .split(separator: " ")
    .map{(Int($0)!)}

var coin = [Int]()
var answer = 0

for _ in 0..<input![0]{
    coin.append(Int(readLine()!)!)
}

while input![1] != 0{
    for i in coin.reversed(){
        if input![1] >= i{
            answer += input![1] / i
            input![1] %= i
        }
    }
}

print(answer)






