//
//  main.swift
//  BJ1920
//
//  Created by 안홍범 on 9/7/24.
//

import Foundation

//let N = Int(readLine()!)!
//
//var arr_N = readLine()!.split(separator: " ").map{Int($0)!}
//
//let M = Int(readLine()!)!
//
//var arr_M = readLine()!.split(separator: " ").map{Int($0)!}
//
//for i in 0..<M {
//    if arr_N.contains(arr_M[i]) {
//        print(1)
//    } else {
//        print(0)
//    }
//}

// -> 1차 풀이: 시간 초과

let N = Int(readLine()!)!

var arr_N = readLine()!.split(separator: " ").map{Int($0)!}.sorted()

let M = Int(readLine()!)!

var arr_M = readLine()!.split(separator: " ").map{Int($0)!}

func binarySearch(_ target: Int) -> Int {
    var start = 0
    var end = arr_N.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if arr_N[mid] == target {
            return 1
        } else if arr_N[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return 0
}

for i in 0..<M {
    print(binarySearch(arr_M[i]))
}









