//
//  main.swift
//  BJ1620
//
//  Created by 안홍범 on 10/2/24.
//

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

let (N,M) = (input[0],input[1])
var dic = [String:Int]()
var dic2 = [Int:String]()

for i in 0..<N {
    let input = readLine()!
    dic[input] = i+1
    dic2[i+1] = input
}

for i in 0..<M {
    let input = readLine()!
    if let num = Int(input) { // 도감 번호일 때
        print(dic2[num]!)
    } else { // 포켓몬 이름일 때
        print(dic[input]!)
    }
}


