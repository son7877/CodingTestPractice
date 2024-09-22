//
//  main.swift
//  BJ30804
//
//  Created by 안홍범 on 9/22/24.
//
// 투 포인터로 접근해서 풀이
// 1차 시도 : 시간 초과
// 2차 시도 : 틀렸습니다.

import Foundation

let N = Int(readLine()!)!

var fruits = readLine()!
    .split(separator: " ")
    .map{Int($0)!}

// MARK: - 1차 시도

//var kinds = Set(fruits)
//
//var left = 0
//var right = fruits.count - 1
//
//if kinds.count <= 2 { // 과일의 종류가 2개 이하일 때
//    print(fruits.count)
//} else {
//    while kinds.count>2 && left < right {
//        if fruits[left] == fruits[right] {
//            left += 1
//        } else {
//            fruits.remove(at: right)
//            right -= 1
//        }
//        kinds = Set(fruits)
//    }
//    print(fruits.count)
//}

// MARK: - 2차 시도
//var left = 0
//var right = 1
//var count = 1
//
//while right < fruits.count {
//    if fruits[left] == fruits[right] {
//        right += 1
//    } else {
//        if count >= 2 {
//            fruits.remove(at: right)
//            right -= 1
//        }
//        count += 1
//        right += 1
//    }
//}
//
//print(fruits.count)

// MARK: - 3차 시도
//var start = 0
//var end = 0
//
//var count = 1
//
//while end < fruits.count {
//    if fruits[start] != fruits[end] { // 같은 과일이 연속으로 나오지 않을 때
//        if count >= 2 { // 과일의 종류가 3개 이상일 때
//            start += 1
//            count -= 1
//        } else { // 과일의 종류가 2개 이하일 때
//            count += 1
//            end += 1
//        }
//    } else { // 같은 과일이 연속으로 나올 때
//        end += 1
//    }
//}
//let array = fruits[start..<end]
//print(array.count)

// MARK: - 4차 시도

var start = 0
var end = 0
var maxLength = 0
var fruitCount = [Int: Int]() // 과일 종류별 개수를 저장

while end < fruits.count {
    // 현재 end가 가리키는 과일의 개수를 증가
    fruitCount[fruits[end], default: 0] += 1

    while fruitCount.count > 2 {
        fruitCount[fruits[start]]! -= 1
        if fruitCount[fruits[start]]! == 0 {
            fruitCount.removeValue(forKey: fruits[start])
        }
        start += 1
    }

    // 과일의 최대 개수 판별
    maxLength = max(maxLength, end - start + 1)
    end += 1
}

print(maxLength)

