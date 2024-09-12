//
//  main.swift
//  BJ10816
//
//  Created by 안홍범 on 9/12/24.
//

import Foundation

let N = Int(readLine()!)!
var cards = readLine()!
    .split(separator:" ")
    .map{Int($0)!} // 배열
let M = Int(readLine()!)!
let numbers = readLine()!
    .split(separator:" ")
    .map{Int($0)!} // 배열

cards.sort()

var result = [Int]()
var dict = [Int:Int]()

for i in cards {
    if dict.keys.contains(i){
        dict[i]! += 1
    }else{
        dict[i] = 1
    }
}

for i in numbers {
    if dict.keys.contains(i) {
        result.append(dict[i]!)
    } else {
        result.append(0)
    }
}

for i in 0..<result.count{
    print(result[i], terminator: " ")
}




