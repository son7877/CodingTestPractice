//
//  main.swift
//  BJ2805
//
//  Created by 안홍범 on 9/21/24.
//

// 1차 제출 : 시간초과
// 원인 추론 : 시간 복잡도 O(N^2)으로 인한 시간초과
// 해결 방안 : 이분 탐색 시도

import Foundation

let input = readLine()!
    .split(separator: " ")
    .map{ Int($0)! }

let tree = input[0]
let need = input[1]

var treesHeight = readLine()!
    .split(separator: " ")
    .map{ Int($0)! }

// MARK: - 1차 시도
//    .sorted(by: >) // 내림차순
//
//var sum = 0
//var cut = treesHeight[0] - 1
//
//while true {
//    for i in 0..<treesHeight.count{
//        if treesHeight[i] <= cut {
//            break
//        }
//        sum += treesHeight[i] - cut
//    }
//    if sum >= need {
//        break
//    }
//    sum = 0
//    cut -= 1
//}
//
//print(cut)

// MARK: - 2차 시도
var start = 0
var end = treesHeight.max()!

while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    for i in 0..<tree {
        if treesHeight[i] > mid {
            sum += treesHeight[i] - mid
        }
    }
    if sum >= need {
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(end)



